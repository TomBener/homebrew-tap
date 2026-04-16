class Zotagent < Formula
  desc "Zotero literature search CLI for AI agents"
  homepage "https://github.com/TomBener/zotagent"
  version "0.13.0"
  url "https://github.com/TomBener/zotagent/releases/download/v0.13.0/zotagent-0.13.0.tgz"
  sha256 "687ecbb5908b4098a7e5eb5eef0810572af5a068aa6bb1ec84a84701aba8542b"

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
