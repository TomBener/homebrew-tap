# brew install --formula --build-from-source ~/Library/Mobile\ Documents/com~apple~CloudDocs/Install-macOS/Homebrew/Formula/bookget.rb
# brew upgrade --formula ~/Library/Mobile\ Documents/com~apple~CloudDocs/Install-macOS/Homebrew/Formula/bookget.rb

class Bookget < Formula
  desc "数字古籍图书下载工具"
  homepage "https://github.com/deweizhu/bookget"
  license "GPL-3.0"
  version "25.0501"

  livecheck do
    url :url
    strategy :github_latest
  end

  on_arm do
    url "https://github.com/deweizhu/bookget/releases/download/25.0213/bookget-25.0213.macOS-arm64.tar.bz2"
    sha256 "4d4ed9a965e111a07d4378a148645cef5c3f2ac09573ec00e5ed913955d00348"
  end

  on_intel do
    odie "bookget is only supported on Apple Silicon (ARM) Macs, you can build it from source on Intel Macs"
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
