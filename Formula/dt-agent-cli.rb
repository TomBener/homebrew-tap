class DtAgentCli < Formula
  desc "Non-interactive CLI for DEVONthink indexing and semantic retrieval"
  homepage "https://github.com/TomBener/dt-agent-cli"
  version "0.1.0"
  url "https://github.com/TomBener/dt-agent-cli/releases/download/v0.1/dt-agent-cli-0.1.0.tgz"
  sha256 "782a43005cb4e7d4e3a3d0277381ca8ab219802bd4eb0e190a0bb0a3227cbb5a"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "node"

  def install
    system "npm", "install", "--omit=dev", *std_npm_args
    bin.install_symlink libexec/"bin/dt"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/dt help")
  end
end
