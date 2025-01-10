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
      # Get all releases including pre-releases
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
    
    return if latest_version == current_version
    
    # Get download URL based on the formula type
    download_url = if formula_path.include?('bookget.rb')
      get_bookget_url(latest_release, latest_version)
    else
      get_default_url(latest_release)
    end

    puts "Calculating SHA256 for #{download_url}"
    new_sha = calculate_sha256(download_url)
    
    # Update the formula
    updated_content = content
      .sub(/version "[^"]+"/, "version \"#{latest_version}\"")
      .sub(/sha256 (?::[^"]+|"[^"]+")/, "sha256 \"#{new_sha}\"")
    
    create_pr(file_path, updated_content, latest_version)
  end

  def get_bookget_url(release, version)
    if RUBY_PLATFORM.include?('x86_64')
      "https://github.com/deweizhu/bookget/releases/download/#{version}/bookget-#{version}.macOS.tar.bz2"
    else
      "https://github.com/deweizhu/bookget/releases/download/#{version}/bookget-#{version}.macOS-arm64.tar.bz2"
    end
  end

  def get_default_url(release)
    release.assets[0].browser_download_url
  end

  def create_pr(file_path, content, version)
    branch_name = "auto-update/#{File.basename(file_path)}-#{version}"
    
    begin
      # Check if branch already exists
      begin
        @client.ref(@repo, "heads/#{branch_name}")
        puts "Branch #{branch_name} already exists, skipping update"
        return
      rescue Octokit::NotFound
        # Branch doesn't exist, continue with creation
      end

      # Get the current file to obtain its SHA
      current_file = @client.contents(@repo, path: file_path)
      file_sha = current_file.sha
      
      puts "Creating branch #{branch_name}"
      # Create branch
      main_ref = @client.ref(@repo, 'heads/main')
      @client.create_ref(@repo, "refs/heads/#{branch_name}", main_ref.object.sha)
      
      puts "Updating file #{file_path}"
      # Create commit with file SHA
      @client.create_contents(
        @repo,
        file_path,
        "Update #{File.basename(file_path)} to #{version}",
        content,
        branch: branch_name,
        sha: file_sha
      )
      
      puts "Creating pull request"
      # Create PR
      @client.create_pull_request(
        @repo,
        'main',
        branch_name,
        "Update #{File.basename(file_path)} to #{version}",
        "Auto-update #{File.basename(file_path)} to version #{version}"
      )
      
      puts "Successfully created PR for #{file_path} update"
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