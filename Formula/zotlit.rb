class Zotlit < Formula
  desc "Zotero literature search CLI for AI agents"
  homepage "https://github.com/TomBener/zotlit"
  version "0.4.0"
  url "https://github.com/TomBener/zotlit/releases/download/v0.4.0/zotlit-0.4.0.tgz"
  sha256 "cffacad2448921253be0cc586e1a43cc5e71b2ba616bd982497b726560f9c9a6"

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
