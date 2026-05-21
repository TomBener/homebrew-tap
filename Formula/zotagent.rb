class Zotagent < Formula
  desc "Zotero literature search CLI for AI agents"
  homepage "https://github.com/TomBener/zotagent"
  version "0.36.0"
  url "https://github.com/TomBener/zotagent/releases/download/v0.36.0/zotagent-0.36.0.tgz"
  sha256 "c3493e7f7e17911bc4ebdd216656757adcf4b3916dbfda8ff0364ac8bd74db09"

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
