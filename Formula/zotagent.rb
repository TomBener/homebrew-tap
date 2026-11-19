class Zotagent < Formula
  desc "Zotero literature search CLI for AI agents"
  homepage "https://github.com/TomBener/zotagent"
  version "2026.11.19"
  url "https://github.com/TomBener/zotagent/releases/download/v2026.11.19/zotagent-2026.11.19.tgz"
  sha256 "94371d9a2f3ce7d3627b77e6cb802f5a699dc7c7aed3ecef989b527f2abf2edb"

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
