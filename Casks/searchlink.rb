cask "searchlink" do
    version "2.3.96"
    sha256 "371fa0d34467bd84daa4c728c48cdf1219baa4b65aaf6d89d9c0103ecb6f2004"

    url "https://github.com/ttscoff/searchlink/releases/download/2.3.96/SearchLink.zip"
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
