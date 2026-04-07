class Zotlit < Formula
  desc "Zotero literature search CLI for AI agents"
  homepage "https://github.com/TomBener/zotlit"
  version "0.6.0"
  url "https://github.com/TomBener/zotlit/releases/download/v0.6.0/zotlit-0.6.0.tgz"
  sha256 "61bd7687dc6c0fd3420de7b3a177ed7025304a0582acf3593fdf66e784cfaa86"

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
