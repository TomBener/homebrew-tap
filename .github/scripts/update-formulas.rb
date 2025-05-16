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
      update_quarto_prerelease(content, version, release)
    when 'searchlink.rb'
      update_searchlink(content, version, release)
    when 'bookget.rb'
      update_bookget(content, version, release)
    else
      raise "Unknown formula/cask: #{formula_path}"
    end
  end

  def update_quarto_prerelease(content, version, release)
    asset = release.assets.find { |a| a.name.end_with?('macos.pkg') }
    raise "Could not find macOS package" unless asset
    new_sha = calculate_sha256(asset.browser_download_url)
    content
      .sub(/version "[^"]+"/, "version \"#{version}\"")
      .sub(/sha256 (?::[^"]+|"[^"]+")/, "sha256 \"#{new_sha}\"")
      .sub(
        /^\s*url.*$/,
        "  url \"#{asset.browser_download_url}\""
      )
  end

  def update_searchlink(content, version, release)
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
  end

  def update_bookget(content, version, release)
    # Find Mac assets (both Intel and ARM)
    arm_asset = release.assets.find { |a| a.name == 'bookget-macos-arm64' }
    intel_asset = release.assets.find { |a| a.name == 'bookget-macos' }
    
    # Verify assets exist
    raise "Could not find ARM asset" unless arm_asset
    raise "Could not find Intel asset" unless intel_asset
    
    # Calculate SHA256 checksums
    arm_sha = calculate_sha256(arm_asset.browser_download_url)
    intel_sha = calculate_sha256(intel_asset.browser_download_url)
    
    # Create updated install method with proper formatting
    install_method = <<-RUBY
  def install
    bin.install Hardware::CPU.arm? ? "bookget-macos-arm64" : "bookget-macos" => "bookget"
  end
RUBY
    
    # Update formula content with proper spacing
    arm_block = <<-RUBY
  on_arm do
    url "#{arm_asset.browser_download_url}"
    sha256 "#{arm_sha}"
  end
RUBY

    intel_block = <<-RUBY
  on_intel do
    url "#{intel_asset.browser_download_url}"
    sha256 "#{intel_sha}"
  end
RUBY
    
    # First fix the double end issue by cleaning up the content
    cleaned_content = content.gsub(/^(\s+end\s*$\s+)+end\s*$/, "\n  end\n")
    
    # Fix indentation issues by using regex that matches regardless of leading whitespace
    updated_content = cleaned_content
      .sub(/version "[^"]+"/, "version \"#{version}\"")
      .sub(/^\s*on_arm do.*?end/m, arm_block.strip)
      .sub(/^\s*on_intel do.*?end/m, intel_block.strip)
      .sub(/def install.*?end(\s*end)?/m, install_method.strip)
    
    # Fix any multiple consecutive empty lines
    updated_content.gsub!(/\n{3,}/, "\n\n")
    
    updated_content
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
