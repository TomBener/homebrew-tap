cask "searchlink" do
    version "2.3.93"
    sha256 "7bf7230a6b8e32cb2c30ff94b1f58e7beb3d7f2ea53d3aac759d217bb5a608fd"

    url "https://github.com/ttscoff/searchlink/releases/download/2.3.93/SearchLink.zip"
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
