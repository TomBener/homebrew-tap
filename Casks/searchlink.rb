cask "searchlink" do
    version "2.3.74"
    sha256 "e99c51ea5cf95d6a73be3a5b523897689e63a18c6967e435303c20506ff53e36"

    url "https://github.com/ttscoff/searchlink/releases/download/#{version}/SearchLink.zip"
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
