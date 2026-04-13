class Zotlit < Formula
  desc "Zotero literature search CLI for AI agents"
  homepage "https://github.com/TomBener/zotlit"
  version "0.8.1"
  url "https://github.com/TomBener/zotlit/releases/download/v0.8.1/zotlit-0.8.1.tgz"
  sha256 "ce5feb2ba35620823ed033cd99ad9c02caee734f09298bb97ed56836873cdb37"

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
