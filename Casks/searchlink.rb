cask "searchlink" do
    version "2.3.92"
    sha256 "20a6bba74cf6a8b6c1fd693f0e37c2b8aaf24e6995b901d2dcf3c688789fd14f"

    url "https://github.com/ttscoff/searchlink/releases/download/2.3.92/SearchLink.zip"
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
