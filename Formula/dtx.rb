class Dtx < Formula
  desc "DEVONthink CLI indexing and semantic retrieval"
  homepage "https://github.com/TomBener/dtx"
  version "0.10.0"
  url "https://github.com/TomBener/dtx/releases/download/v0.10.0/dtx-0.10.0.tgz"
  sha256 "bc50784d8f9cb607c90482f96b7acf120360cc8788a7d17acaf87a2bc712a959"
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
