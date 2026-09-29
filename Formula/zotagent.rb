class Zotagent < Formula
  desc "Zotero literature search CLI for AI agents"
  homepage "https://github.com/TomBener/zotagent"
  version "2026.9.28"
  url "https://github.com/TomBener/zotagent/releases/download/v2026.9.28/zotagent-2026.9.28.tgz"
  sha256 "6fffd85c2aa27841aaee8feb8e8e0d58a67cfc5c938a1c3e41160040af2d4468"

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
