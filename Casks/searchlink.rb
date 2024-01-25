cask "searchlink" do
    version "2.3.65"
    sha256 "b494716db3d4991cad0c981e7fca69ccde3168312d5bcbecef0d5f06db5bc0d8"

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
