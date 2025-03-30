cask "searchlink" do
    version "2.3.85"
    sha256 "316edf3f47282c491e399e4b7e9792a053462e1820c1c2842499328ab924bab9"

    url "https://github.com/ttscoff/searchlink/releases/download/2.3.85/SearchLink.zip"
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
