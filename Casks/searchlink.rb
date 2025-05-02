cask "searchlink" do
    version "2.3.89"
    sha256 "e45fb2f60dfaf6756998a56a80dc96927059fb8a3767e34b0be0cbed313a37ed"

    url "https://github.com/ttscoff/searchlink/releases/download/2.3.89/SearchLink.zip"
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
