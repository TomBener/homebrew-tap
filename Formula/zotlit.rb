class Zotlit < Formula
  desc "Zotero literature search CLI for AI agents"
  homepage "https://github.com/TomBener/zotlit"
  version "0.6.1"
  url "https://github.com/TomBener/zotlit/releases/download/v0.6.1/zotlit-0.6.1.tgz"
  sha256 "14da2c2998f48dca865afb64b86a2bf8f0a13fd8cba0542f7ea9b65034a49739"

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
