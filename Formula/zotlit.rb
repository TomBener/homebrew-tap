class Zotlit < Formula
  desc "Zotero literature search CLI for AI agents"
  homepage "https://github.com/TomBener/zotlit"
  version "0.5.4"
  url "https://github.com/TomBener/zotlit/releases/download/v0.5.4/zotlit-0.5.4.tgz"
  sha256 "347077a79d21d00ca9e51eb51f56b1bb659a365ec64c6faf7a1aca3e87b72e80"

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
