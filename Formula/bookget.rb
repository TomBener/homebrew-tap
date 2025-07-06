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
    sha256 "7e1fdfc156c000fd02adc6a8cedeb9c9336ac02b3ea7971e00700e4eee3eea7d"
  end

  on_intel do
    url "https://github.com/deweizhu/bookget/releases/download/v25.0701/bookget-macos"
    sha256 "4ed60aeeb0c930b0e9adfb9063c0461bad16eb98dac9eef52d8b7a0469145913"
  end
  def install
    bin.install Hardware::CPU.arm? ? "bookget-macos-arm64" : "bookget-macos" => "bookget"
  end
  test do
    # The test will run `bookget -v` to verify the installation
    system "#{bin}/bookget", "-v"
  end
end
