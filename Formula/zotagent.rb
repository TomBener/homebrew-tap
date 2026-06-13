class Zotagent < Formula
  desc "Zotero literature search CLI for AI agents"
  homepage "https://github.com/TomBener/zotagent"
  version "0.38.0"
  url "https://github.com/TomBener/zotagent/releases/download/v0.38.0/zotagent-0.38.0.tgz"
  sha256 "12885f39e6c4a2d80747f1d94e8bd947d19fe3fbf173505e9713fe92b7f23342"

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
