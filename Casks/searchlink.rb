cask "searchlink" do
    version "2.3.86"
    sha256 "5d63eb9f3189a5bf0ca0da1e0e08631436972439e09c44ff01bbcfb9d39a2424"

    url "https://github.com/ttscoff/searchlink/releases/download/2.3.86/SearchLink.zip"
    name "SearchLink"
    desc "A macOS Service for Markdown writers to add hyperlinks without switching to the browser"
    homepage "https://github.com/ttscoff/searchlink"

    livecheck do
      url :url
      strategy :github_latest
    end

    service "SearchLink Services/Jump to SearchLink Error.workflow"
    service "SearchLink Services/SearchLink File.workflow"
    service "SearchLink Services/SearchLink.workflow"
  end
