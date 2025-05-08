# brew install --formula --build-from-source ~/Library/Mobile\ Documents/com~apple~CloudDocs/Install-macOS/Homebrew/Formula/bookget.rb
# brew upgrade --formula ~/Library/Mobile\ Documents/com~apple~CloudDocs/Install-macOS/Homebrew/Formula/bookget.rb

class Bookget < Formula
  desc "数字古籍图书下载工具"
  homepage "https://github.com/deweizhu/bookget"
  license "GPL-3.0"
  version "25.0508"

  livecheck do
    url :url
    strategy :github_latest
  end

      on_arm do
    url "https://github.com/deweizhu/bookget/releases/download/v25.0508/bookget-macos-arm64"
    sha256 "8305087fec96540433ad39f1008fb43a47627f439aea5b1cc7d5200e3fcdb08b"
  end



      on_intel do
    url "https://github.com/deweizhu/bookget/releases/download/v25.0508/bookget-macos"
    sha256 "aa345fa2229312076685b717e26cd8b60e18feee488e91168f792f3b5c75a3f0"
  end



  def install
    bin.install Hardware::CPU.arm? ? "bookget-macos-arm64" : "bookget-macos" => "bookget"
  end
  end

  test do
    # The test will run `bookget -v` to verify the installation
    system "#{bin}/bookget", "-v"
  end
end
