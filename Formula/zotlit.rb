class Zotlit < Formula
  desc "Zotero literature search CLI for AI agents"
  homepage "https://github.com/TomBener/zotlit"
  version "0.8.0"
  url "https://github.com/TomBener/zotlit/releases/download/v0.8.0/zotlit-0.8.0.tgz"
  sha256 "fc2972aa76b73880865bf4f3d1fa071554c33e70944fb5afe7b6bf32a68301e2"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "node"
  depends_on "openjdk"

  def install
    system "npm", "install", "--omit=dev", *std_npm_args(ignore_scripts: false)
    (bin/"zotlit").write_env_script libexec/"bin/zotlit", Language::Java.overridable_java_home_env
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/zotlit help")
  end
end
