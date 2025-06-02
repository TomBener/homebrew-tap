class Bookget < Formula
  desc "数字古籍图书下载工具"
  homepage "https://github.com/deweizhu/bookget"
  license "GPL-3.0"
  version "25.0601"

  livecheck do
    url :url
    strategy :github_latest
  end

  on_arm do
    url "https://github.com/deweizhu/bookget/releases/download/v25.0601/bookget-macos-arm64"
    sha256 "8945aa377c4d319c895bb4d99d98ebf7974ff2530ddd2f140e7b4ce7ec919f4d"
  end

  on_intel do
    url "https://github.com/deweizhu/bookget/releases/download/v25.0601/bookget-macos"
    sha256 "314e932be9dfcaffa20177c6164f0298e65bed4f12254ba782a2e5cd1073febd"
  end

        def install
    bin.install Hardware::CPU.arm? ? "bookget-macos-arm64" : "bookget-macos" => "bookget"
  end

        test do
    # The test will run `bookget -v` to verify the installation
    system "#{bin}/bookget", "-v"
  end
end
