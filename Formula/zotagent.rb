class Zotagent < Formula
  desc "Zotero literature search CLI for AI agents"
  homepage "https://github.com/TomBener/zotagent"
  version "2026.8.17"
  url "https://github.com/TomBener/zotagent/releases/download/v2026.8.17/zotagent-2026.8.17.tgz"
  sha256 "e06f348ef2d1c86f7061c060be3518b1acaab2f74a7a62e86ab44b0922469dcf"

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
