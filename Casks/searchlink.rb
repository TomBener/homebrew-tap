cask "searchlink" do
    version "2.3.71"
    sha256 "3e1d9cccdffa7c659b95ebe1a9d3bf9a748e8ada26cc89a35eec83c0b96e8ac9"

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
