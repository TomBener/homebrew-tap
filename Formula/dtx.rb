class Dtx < Formula
  desc "DEVONthink CLI indexing and semantic retrieval"
  homepage "https://github.com/TomBener/dtx"
  version "0.10.1"
  url "https://github.com/TomBener/dtx/releases/download/v0.10.1/dtx-0.10.1.tgz"
  sha256 "c394f1af5b4cefaade35d2937b5404b37e6f4cebcfabe84a4d866529293cf167"
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
