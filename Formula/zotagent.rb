class Zotagent < Formula
  desc "Zotero literature search CLI for AI agents"
  homepage "https://github.com/TomBener/zotagent"
  version "0.22.0"
  url "https://github.com/TomBener/zotagent/releases/download/v0.22.0/zotagent-0.22.0.tgz"
  sha256 "a55bc4c99d379bd4f56cead4e5700c817d3d6f1ecf81f16ebac48cd9884c8e2f"

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
