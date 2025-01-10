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
      # Find the correct asset for macOS
      macos_asset = latest_release.assets.find { |a| a.name.end_with?('macos.pkg') }
      raise "Could not find macOS package in release assets" unless macos_asset
      
      new_sha = calculate_sha256(macos_asset.browser_download_url)
      
      # Update version and sha256 separately
      updated_content = content
        .sub(/version "[^"]+"/, "version \"#{latest_version}\"")
        .sub(
          /sha256 (?::[^"]+|"[^"]+").*$/, 
          "sha256 \"#{new_sha}\"\n  url \"https://github.com/quarto-dev/quarto-cli/releases/download/v#{latest_version}/quarto-#{latest_version}-macos.pkg\","
        )
      
      commit_update(formula_path, updated_content, latest_version)
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