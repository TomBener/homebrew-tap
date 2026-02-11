class DtAgentCli < Formula
  desc "Non-interactive CLI for DEVONthink indexing and semantic retrieval"
  homepage "https://github.com/TomBener/dt-agent-cli"
  version "0.2.0"
  url "https://github.com/TomBener/dt-agent-cli/releases/download/v0.2.0/dt-agent-cli-0.2.0.tgz"
  sha256 "9d68cb97db8e6689fdd4ed07b0b9ba5b2aa77e1ee10f1a8f864f6eb27de742de"
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
