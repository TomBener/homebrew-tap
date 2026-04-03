class Zotlit < Formula
  desc "Zotero literature search CLI for AI agents"
  homepage "https://github.com/TomBener/zotlit"
  version "0.5.1"
  url "https://github.com/TomBener/zotlit/releases/download/v0.5.1/zotlit-0.5.1.tgz"
  sha256 "f6f2ad826bd840cbafd0a18b8d58c0ad884c185dbf8ac197298e1328b38fe0dd"

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
