cask "searchlink" do
    version "2.3.91"
    sha256 "42c2f5ab52b0d70e2d137d647c6260444b39ba6eacd96e2bcecbc5f9fba8fe61"

    url "https://github.com/ttscoff/searchlink/releases/download/2.3.91/SearchLink.zip"
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
