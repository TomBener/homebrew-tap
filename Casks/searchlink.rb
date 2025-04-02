cask "searchlink" do
    version "2.3.88"
    sha256 "39f36da459ef2381c8ad0e030bbeaa2d75e9b3ac2f8a23bd0f33a1b639e044ba"

    url "https://github.com/ttscoff/searchlink/releases/download/2.3.88/SearchLink.zip"
    name "SearchLink"
    desc "A macOS Service for Markdown writers to add hyperlinks without switching to the browser"
    homepage "https://github.com/ttscoff/searchlink"

    livecheck do
      url :url
      strategy :github_latest
    end

    service "SearchLink Services/Preview URL.workflow"
    service "SearchLink Services/SearchLink File.workflow"
    service "SearchLink Services/SearchLink.workflow"
  end
