cask "searchlink" do
    version "2.3.87"
    sha256 "7d8364e57a80f6ea9725d65d44b45f814e3f7451fbefc471281e129db78389c9"

    url "https://github.com/ttscoff/searchlink/releases/download/2.3.87/SearchLink.zip"
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
