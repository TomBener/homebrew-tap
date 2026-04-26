class Zotagent < Formula
  desc "Zotero literature search CLI for AI agents"
  homepage "https://github.com/TomBener/zotagent"
  version "0.26.0"
  url "https://github.com/TomBener/zotagent/releases/download/v0.26.0/zotagent-0.26.0.tgz"
  sha256 "a126e17cdfbf506faa11d7d4f9d507be0976e5160c8a2a94ec9fa218fb99e735"

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
