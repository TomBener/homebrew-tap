# brew install --formula --build-from-source ~/Library/Mobile\ Documents/com~apple~CloudDocs/Install-macOS/Homebrew/Formula/bookget.rb
# brew upgrade --formula ~/Library/Mobile\ Documents/com~apple~CloudDocs/Install-macOS/Homebrew/Formula/bookget.rb

class Bookget < Formula
  desc "数字古籍图书下载工具"
  homepage "https://github.com/deweizhu/bookget"
  license "GPL-3.0"
  version "24.1118"

  livecheck do
    url :url
    strategy :github_latest
  end

  if Hardware::CPU.intel?
    url "https://github.com/deweizhu/bookget/releases/download/24.1118/bookget-24.1118.macOS.tar.bz2"
    sha256 "146059cfa50589b3941010216e4ac04de855ea4d7c99a84190adf06b17f92ae5"
  else
    url "https://github.com/deweizhu/bookget/releases/download/24.1118/bookget-24.1118.macOS-arm64.tar.bz2"
    sha256 "bef4be1c50d2a32cd46c2f64e5597e77cf4d76ff0e63addf4e9d7ebe3f43cadb"
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
