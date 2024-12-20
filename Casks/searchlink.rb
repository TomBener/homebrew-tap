cask "searchlink" do
    version "2.3.80"
    sha256 "1fec1cf0d6c1eba7bd84bfda7bd97f15b8447e4414d2277812f3348bbe3634fd"

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
