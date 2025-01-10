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
    @config['formulas'].each do |name, formula|
      next unless formula['type'] == 'github'
      update_github_release(formula['repo'], formula['file'])
    end
  end

  private

  def update_github_release(repo, formula_path)
    latest_release = @client.latest_release(repo)
    latest_version = latest_release.tag_name.gsub(/^v/, '')
    
    content = File.read(formula_path)
    current_version = content.match(/version "([^"]+)"/)[1]
    
    return if latest_version == current_version
    
    # Get download URL based on the formula type
    download_url = if formula_path.include?('bookget.rb')
      get_bookget_url(latest_release, latest_version)
    else
      get_default_url(latest_release)
    end

    new_sha = calculate_sha256(download_url)
    
    # Update the formula
    updated_content = content
      .sub(/version "[^"]+"/, "version \"#{latest_version}\"")
      .sub(/sha256 (?::[^"]+|"[^"]+")/, "sha256 \"#{new_sha}\"")
    
    create_pr(formula_path, updated_content, latest_version)
  end

  def get_bookget_url(release, version)
    if Hardware::CPU.intel?
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
    
    # Create branch
    ref = @client.ref(@repo, 'heads/main')
    @client.create_ref(@repo, "refs/heads/#{branch_name}", ref.object.sha)
    
    # Create commit
    @client.create_contents(
      @repo,
      file_path,
      "Update #{File.basename(file_path)} to #{version}",
      content,
      branch: branch_name
    )
    
    # Create PR
    @client.create_pull_request(
      @repo,
      'main',
      branch_name,
      "Update #{File.basename(file_path)} to #{version}",
      "Auto-update #{File.basename(file_path)} to version #{version}"
    )
  end

  def calculate_sha256(url)
    response = HTTP.follow.get(url)
    Digest::SHA256.hexdigest(response.body.to_s)
  end
end

updater = FormulaUpdater.new
updater.update_all 