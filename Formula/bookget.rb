# brew install --formula --build-from-source ~/Library/Mobile\ Documents/com~apple~CloudDocs/Install-macOS/Homebrew/Formula/bookget.rb
# brew upgrade --formula ~/Library/Mobile\ Documents/com~apple~CloudDocs/Install-macOS/Homebrew/Formula/bookget.rb

class Bookget < Formula
  desc "数字古籍图书下载工具"
  homepage "https://github.com/deweizhu/bookget"
  license "GPL-3.0"
  version "24.0116"

  livecheck do
    url :url
    strategy :github_latest
  end

  if Hardware::CPU.intel?
    url "https://github.com/deweizhu/bookget/releases/download/#{version}/bookget-#{version}.macOS.tar.bz2"
  else
    url "https://github.com/deweizhu/bookget/releases/download/#{version}/bookget-#{version}.macOS-arm64.tar.bz2"
  end

  def install
    bin.install "bookget"
    bin.install "dezoomify-rs" # Also install `dezoomify-rs`
  end

  test do
    # The test will run `bookget -v` to verify the installation
    system "#{bin}/bookget", "-v"
  end
end
