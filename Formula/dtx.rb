class Dtx < Formula
  desc "DEVONthink CLI indexing and semantic retrieval"
  homepage "https://github.com/TomBener/dtx"
  version "0.2.1"
  url "https://github.com/TomBener/dtx/releases/download/v0.2.1/dtx-0.2.1.tgz"
  sha256 "8fd4de6642baf054a3ee73e3e96b5e655362dc01256b52d1942e8e1e9d075cbe"
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
