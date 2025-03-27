cask "searchlink" do
    version "2.3.84"
    sha256 "592e742e6ab1c742d9c287c93efe928f0185600a5957c667187d882733e8121d"

    url "https://github.com/ttscoff/searchlink/releases/download/2.3.84/SearchLink.zip"
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
