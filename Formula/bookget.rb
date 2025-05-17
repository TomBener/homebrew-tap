class Bookget < Formula
  desc "数字古籍图书下载工具"
  homepage "https://github.com/deweizhu/bookget"
  license "GPL-3.0"
  version "25.0517"

  livecheck do
    url :url
    strategy :github_latest
  end

  on_arm do
    url "https://github.com/deweizhu/bookget/releases/download/v25.0517/bookget-macos-arm64"
    sha256 "da7094cfefabd91e1d15870ad1de53d3a123461e74b0f504b3ab4d027ec32ed1"
  end

  on_intel do
    url "https://github.com/deweizhu/bookget/releases/download/v25.0517/bookget-macos"
    sha256 "39a23d42897be56b2fc87304702b718bc0cbbe3a301cb624f6b678c736f50861"
  end

      def install
    bin.install Hardware::CPU.arm? ? "bookget-macos-arm64" : "bookget-macos" => "bookget"
  end

      test do
    # The test will run `bookget -v` to verify the installation
    system "#{bin}/bookget", "-v"
  end
end
