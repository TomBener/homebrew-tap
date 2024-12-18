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
    url "https://github.com/deweizhu/bookget/releases/download/#{version}/bookget-#{version}.macOS.tar.bz2"
    sha256 "b5fbbcd8ad35d093ef0ff0944e43848eb4f9d1f7be330433707b103ba79dbd89"
  else
    url "https://github.com/deweizhu/bookget/releases/download/#{version}/bookget-#{version}.macOS-arm64.tar.bz2"
    sha256 "bc2a7782f1728b0f09bea796c9d83f041748daf5649d2c375393bfc112475653"
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
