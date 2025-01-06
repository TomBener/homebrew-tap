cask "searchlink" do
    version "2.3.81"
    sha256 "c455622b2a121f1c5419f8443d619c7e146ba454ef9cba832cd8705851ba2c91"

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
