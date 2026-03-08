class Dtx < Formula
  desc "DEVONthink CLI indexing and semantic retrieval"
  homepage "https://github.com/TomBener/dtx"
  version "0.5.0"
  url "https://github.com/TomBener/dtx/releases/download/v0.5.0/dtx-0.5.0.tgz"
  sha256 "e765cad45da30f24b3e07c740656477ab3a05c7f5f33511b6469c42ce93eb574"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "node"

  def install
    system "npm", "install", "--omit=dev", *std_npm_args
    bin.install_symlink libexec/"bin/dtx"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/dtx help")
  end
end
