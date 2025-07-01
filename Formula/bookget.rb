class Bookget < Formula
  desc "数字古籍图书下载工具"
  homepage "https://github.com/deweizhu/bookget"
  license "GPL-3.0"
  version "25.0701"

  livecheck do
    url :url
    strategy :github_latest
  end

  on_arm do
    url "https://github.com/deweizhu/bookget/releases/download/v25.0701/bookget-macos-arm64"
    sha256 "1f92fdb2290ff4f29398bd1c0a240c82a08a2eb09cb31c2f0ce85590d87d3f61"
  end

  on_intel do
    url "https://github.com/deweizhu/bookget/releases/download/v25.0701/bookget-macos"
    sha256 "cf5cb247a0c68401d9c48f76a484d771d4d40ab2d67adfbd1a74a5a34929c353"
  end
  def install
    bin.install Hardware::CPU.arm? ? "bookget-macos-arm64" : "bookget-macos" => "bookget"
  end
  test do
    # The test will run `bookget -v` to verify the installation
    system "#{bin}/bookget", "-v"
  end
end
