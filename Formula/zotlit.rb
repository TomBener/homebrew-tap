class Zotlit < Formula
  desc "Zotero literature search CLI for AI agents"
  homepage "https://github.com/TomBener/zotlit"
  version "0.6.2"
  url "https://github.com/TomBener/zotlit/releases/download/v0.6.2/zotlit-0.6.2.tgz"
  sha256 "6890f0cd8fa046dbfe625fd73f139e8fd3e4a180c7a935c30ef0fd9f17a2bdc7"

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
