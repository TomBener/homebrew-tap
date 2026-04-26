class Zotagent < Formula
  desc "Zotero literature search CLI for AI agents"
  homepage "https://github.com/TomBener/zotagent"
  version "0.27.1"
  url "https://github.com/TomBener/zotagent/releases/download/v0.27.1/zotagent-0.27.1.tgz"
  sha256 "9c49e84b392bb8ddc6a96fcbad9bd0588c15a175c3320e762aba4078be0d1ccd"

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
