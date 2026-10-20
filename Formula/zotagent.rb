class Zotagent < Formula
  desc "Zotero literature search CLI for AI agents"
  homepage "https://github.com/TomBener/zotagent"
  version "2026.10.20"
  url "https://github.com/TomBener/zotagent/releases/download/v2026.10.20/zotagent-2026.10.20.tgz"
  sha256 "c558bdf6983584d82edd4684e01ff9012ed936be38491778972a2e6da260fc3b"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "node"
  depends_on "openjdk"

  def install
    system "npm", "install", "--omit=dev", *std_npm_args(ignore_scripts: false)
    (bin/"zotagent").write_env_script libexec/"bin/zotagent", Language::Java.overridable_java_home_env
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/zotagent help")
  end
end
