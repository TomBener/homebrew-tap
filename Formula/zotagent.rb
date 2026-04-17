class Zotagent < Formula
  desc "Zotero literature search CLI for AI agents"
  homepage "https://github.com/TomBener/zotagent"
  version "0.15.0"
  url "https://github.com/TomBener/zotagent/releases/download/v0.15.0/zotagent-0.15.0.tgz"
  sha256 "081ff7d98f567b7e3876ee325ce5dcd580b5a7a8255584cb141b49e1bb3058ad"

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
