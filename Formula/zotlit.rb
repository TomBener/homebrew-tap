class Zotlit < Formula
  desc "Zotero literature search CLI for AI agents"
  homepage "https://github.com/TomBener/zotlit"
  version "0.4.1"
  url "https://github.com/TomBener/zotlit/releases/download/v0.4.1/zotlit-0.4.1.tgz"
  sha256 "fa5198196145a3d73dc56c6f115b5c7febf6b366997b141c1123f7e2330d2671"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "node"
  depends_on "openjdk"

  def install
    system "npm", "install", "--omit=dev", *std_npm_args(ignore_scripts: false)
    (bin/"zotlit").write_env_script libexec/"bin/zotlit", Language::Java.overridable_java_home_env
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/zotlit help")
  end
end
