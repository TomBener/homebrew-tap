# brew install --formula --build-from-source ~/Library/Mobile\ Documents/com~apple~CloudDocs/Install-macOS/Homebrew/Formula/bookget.rb
# brew upgrade --formula ~/Library/Mobile\ Documents/com~apple~CloudDocs/Install-macOS/Homebrew/Formula/bookget.rb

class Bookget < Formula
  desc "数字古籍图书下载工具"
  homepage "https://github.com/deweizhu/bookget"
  license "GPL-3.0"
  version "25.0507"

  livecheck do
    url :url
    strategy :github_latest
  end

    on_arm do
    url "https://github.com/deweizhu/bookget/releases/download/v25.0507/bookget-macos-arm64"
    sha256 "c39939f3ea91e51b06c1515f1ca1f3fbcaa9cc75e638709e0d3b61934c2d381c"
  end


    on_intel do
    url "https://github.com/deweizhu/bookget/releases/download/v25.0507/bookget-macos"
    sha256 "6a0a59cc0c5b8957af4319fca51a40758433e2b629b17675c0b581953eea3139"
  end


  def install
    if Hardware::CPU.arm?
      bin.install "bookget-macos-arm64" => "bookget"
    else
      bin.install "bookget-macos" => "bookget"
    end
  end

  test do
    # The test will run `bookget -v` to verify the installation
    system "#{bin}/bookget", "-v"
  end
end
