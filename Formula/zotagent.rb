class Zotagent < Formula
  desc "Zotero literature search CLI for AI agents"
  homepage "https://github.com/TomBener/zotagent"
  version "0.34.0"
  url "https://github.com/TomBener/zotagent/releases/download/v0.34.0/zotagent-0.34.0.tgz"
  sha256 "3e9ba3d2cd4ba178bf7e6dccb1be0547c34fbe2fa913d682d0d0b90bd139d2b0"

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
