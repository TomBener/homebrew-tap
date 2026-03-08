class Dtx < Formula
  desc "DEVONthink CLI indexing and semantic retrieval"
  homepage "https://github.com/TomBener/dtx"
  version "0.3.0"
  url "https://github.com/TomBener/dtx/releases/download/v0.3.0/dtx-0.3.0.tgz"
  sha256 "8de8998ae999b5d57667f2f4b07ef34e1430aa1a5a5f61d4a266198bf1645511"
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
