class Zotagent < Formula
  desc "Zotero literature search CLI for AI agents"
  homepage "https://github.com/TomBener/zotagent"
  version "0.31.0"
  url "https://github.com/TomBener/zotagent/releases/download/v0.31.0/zotagent-0.31.0.tgz"
  sha256 "3e3dadae0ea761d9b2f7bb42c0e822966086cb7659f887b8c670dc7f58e208b2"

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
