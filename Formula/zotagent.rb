class Zotagent < Formula
  desc "Zotero literature search CLI for AI agents"
  homepage "https://github.com/TomBener/zotagent"
  version "0.16.2"
  url "https://github.com/TomBener/zotagent/releases/download/v0.16.2/zotagent-0.16.2.tgz"
  sha256 "9e14d568a8e74720b1a11f62186dd757b4773ac7ec1234cf9bc171d7394bad1b"

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
