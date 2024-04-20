# brew install --formula --build-from-source ~/Library/Mobile\ Documents/com~apple~CloudDocs/Install-macOS/Homebrew/Formula/bookget.rb
# brew upgrade --formula ~/Library/Mobile\ Documents/com~apple~CloudDocs/Install-macOS/Homebrew/Formula/bookget.rb

class Bookget < Formula
  desc "数字古籍图书下载工具"
  homepage "https://github.com/deweizhu/bookget"
  license "GPL-3.0"
  version "24.0331"

  livecheck do
    url :url
    strategy :github_latest
  end

  if Hardware::CPU.intel?
    url "https://github.com/deweizhu/bookget/releases/download/#{version}/bookget-#{version}.macOS.tar.bz2"
    # sha256 "90d2675a07e87e9c2ac2712626f72850fdf0ba4d716ee941801040f8d7c8b9db"
  else
    url "https://github.com/deweizhu/bookget/releases/download/#{version}/bookget-#{version}.macOS-arm64.tar.bz2"
    # sha256 "80c733ffb5bc816f72f5e3043055f7ab59b6ed42271804b8e38233eb65dd8c26"
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
