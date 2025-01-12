require 'octokit'
require 'http'
require 'json'
require 'digest'
require 'yaml'

class FormulaUpdater
  def initialize
    @client = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
    @repo = ENV['GITHUB_REPOSITORY']
    @config = YAML.load_file('.github/update-config.yml')
  end

  def update_all
    puts "Starting formula updates..."
    @config['formulas'].each do |name, formula|
      next unless formula['type'] == 'github'
      begin
        puts "Checking #{name}..."
        update_github_release(formula['repo'], formula['file'])
      rescue => e
        puts "Error updating #{name}: #{e.message}"
      end
    end
  end

  private

  def update_github_release(repo, formula_path)
    if formula_path.include?('quarto-prerelease.rb')
      releases = @client.releases(repo)
      latest_release = releases.select(&:prerelease).max_by { |r| Gem::Version.new(r.tag_name.gsub(/^v/, '')) }
      puts "Found latest pre-release: #{latest_release.tag_name}"
    else
      latest_release = @client.latest_release(repo)
    end

    latest_version = latest_release.tag_name.gsub(/^v/, '')
    
    content = File.read(formula_path)
    current_version = content.match(/version "([^"]+)"/)[1]
    
    puts "Current version: #{current_version}"
    puts "Latest version: #{latest_version}"
    
    if Gem::Version.new(latest_version) > Gem::Version.new(current_version)
      updated_content = update_formula_content(content, latest_version, latest_release, formula_path)
      commit_update(formula_path, updated_content, latest_version)
    end
  end

  def update_formula_content(content, version, release, formula_path)
    case File.basename(formula_path)
    when 'quarto-prerelease.rb'
      asset = release.assets.find { |a| a.name.end_with?('macos.pkg') }
      raise "Could not find macOS package" unless asset
      new_sha = calculate_sha256(asset.browser_download_url)
      content
        .sub(/version "[^"]+"/, "version \"#{version}\"")
        .sub(/sha256 (?::[^"]+|"[^"]+")/, "sha256 \"#{new_sha}\"")
        .sub(
          /url "[^"]+"(?:,\s+verified:[^"]+)?/,
          "url \"#{asset.browser_download_url}\""
        )
    
    when 'searchlink.rb'
      asset = release.assets.find { |a| a.name.end_with?('.zip') }
      raise "Could not find zip file" unless asset
      new_sha = calculate_sha256(asset.browser_download_url)
      content
        .sub(/version "[^"]+"/, "version \"#{version}\"")
        .sub(/sha256 "[^"]+"/, "sha256 \"#{new_sha}\"")
        .sub(
          /url "[^"]+"/,
          "url \"#{asset.browser_download_url}\""
        )
    
    when 'bookget.rb'
      # Handle both Intel and ARM versions
      intel_asset = release.assets.find { |a| a.name.include?('macOS.tar.bz2') && !a.name.include?('arm64') }
      arm_asset = release.assets.find { |a| a.name.include?('macOS-arm64.tar.bz2') }
      raise "Could not find required assets" unless intel_asset && arm_asset
      
      intel_sha = calculate_sha256(intel_asset.browser_download_url)
      arm_sha = calculate_sha256(arm_asset.browser_download_url)
      
      content
        .sub(/version "[^"]+"/, "version \"#{version}\"")
        .sub(/sha256 "[^"]+".*?else.*?sha256 "[^"]+"/m) do |match|
          "sha256 \"#{intel_sha}\"\n" \
          "  else\n" \
          "    url \"#{arm_asset.browser_download_url}\"\n" \
          "    sha256 \"#{arm_sha}\""
        end
    else
      raise "Unknown formula/cask: #{formula_path}"
    end
  end

  def commit_update(file_path, content, version)
    begin
      # Get the current file to obtain its SHA
      current_file = @client.contents(@repo, path: file_path)
      
      puts "Committing update to #{file_path}"
      @client.update_contents(
        @repo,
        file_path,
        "Update #{File.basename(file_path)} to #{version}",
        current_file.sha,
        content,
        branch: 'main'
      )
      
      puts "Successfully updated #{file_path} to version #{version}"
    rescue Octokit::Error => e
      puts "GitHub API error: #{e.message}"
      raise
    end
  end

  def calculate_sha256(url)
    retries = 3
    begin
      response = HTTP.follow.get(url)
      Digest::SHA256.hexdigest(response.body.to_s)
    rescue => e
      retries -= 1
      if retries > 0
        puts "Error downloading file, retrying... (#{retries} attempts left)"
        sleep 1
        retry
      else
        raise "Failed to download file after 3 attempts: #{e.message}"
      end
    end
  end
end

updater = FormulaUpdater.new
updater.update_all
