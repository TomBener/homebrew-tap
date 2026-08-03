class Zotagent < Formula
  desc "Zotero literature search CLI for AI agents"
  homepage "https://github.com/TomBener/zotagent"
  version "2026.8.2"
  url "https://github.com/TomBener/zotagent/releases/download/v2026.8.2/zotagent-2026.8.2.tgz"
  sha256 "bca76e30649d3fb77bf8fbc4cffb772eb155bfd6ab90c2272ce5bc7677458563"

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
