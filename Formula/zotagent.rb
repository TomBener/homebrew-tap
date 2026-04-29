class Zotagent < Formula
  desc "Zotero literature search CLI for AI agents"
  homepage "https://github.com/TomBener/zotagent"
  version "0.29.0"
  url "https://github.com/TomBener/zotagent/releases/download/v0.29.0/zotagent-0.29.0.tgz"
  sha256 "a1e80e0613a260bd598297db96c0af64e24e6b712dfd6ed4d3a9cba731561e57"

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
