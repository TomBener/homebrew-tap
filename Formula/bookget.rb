# brew install --formula --build-from-source ~/Library/Mobile\ Documents/com~apple~CloudDocs/Install-macOS/Homebrew/bookget.rb
# brew upgrade --formula ~/Library/Mobile\ Documents/com~apple~CloudDocs/Install-macOS/Homebrew/bookget.rb

class Bookget < Formula
  desc "数字古籍图书下载工具"
  homepage "https://github.com/deweizhu/bookget"
  license "GPL-3.0"
  version "24.0116"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Use Ruby's string interpolation to insert the version number into the URL and file name
  if Hardware::CPU.intel?
    url "https://github.com/deweizhu/bookget/releases/download/#{version}/bookget-#{version}.macOS.tar.bz2"
    sha256 "0d98610d88c2a331235371a4725d559aebd34e62cddea8fa9ed04f04e8829ae6"
  else
    url "https://github.com/deweizhu/bookget/releases/download/#{version}/bookget-#{version}.macOS-arm64.tar.bz2"
    sha256 "24e59ea10f02f1535e9a22309632dd6897e4d39a81eff775982cd93476610269"
  end

  def install
    # The binaries are already built, just install them
    bin.install "bookget"
    # Also install `dezoomify-rs`
    bin.install "dezoomify-rs"
  end

  test do
    # The test will run `bookget -v` to verify the installation
    system "#{bin}/bookget", "-v"
  end
end
