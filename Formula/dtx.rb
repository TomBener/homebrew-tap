class Dtx < Formula
  desc "DEVONthink CLI indexing and semantic retrieval"
  homepage "https://github.com/TomBener/dtx"
  version "0.9.0"
  url "https://github.com/TomBener/dtx/releases/download/v0.9.0/dtx-0.9.0.tgz"
  sha256 "eedec3f68bedcd1d88e6776f33185b5ff69aa81790b88578ebfb3f16c3f6ee76"
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
