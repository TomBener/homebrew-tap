cask "searchlink" do
    version "2.3.94"
    sha256 "ab0715188e53474789ed1ce4d769ba3462280b0c87c4340920fd15705d269678"

    url "https://github.com/ttscoff/searchlink/releases/download/2.3.94/SearchLink.zip"
    name "SearchLink"
    desc "A macOS Service for Markdown writers to add hyperlinks without switching to the browser"
    homepage "https://github.com/ttscoff/searchlink"

    livecheck do
      url :url
      strategy :github_latest
    end

    depends_on :macos

    service "SearchLink Services/Preview URL.workflow"
    service "SearchLink Services/SearchLink File.workflow"
    service "SearchLink Services/SearchLink.workflow"
  end
