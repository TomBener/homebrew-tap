class Zotagent < Formula
  desc "Zotero literature search CLI for AI agents"
  homepage "https://github.com/TomBener/zotagent"
  version "0.35.1"
  url "https://github.com/TomBener/zotagent/releases/download/v0.35.1/zotagent-0.35.1.tgz"
  sha256 "5b4027cdb248177c3fadd6150c93dc06bb5a4d70da5546cf813bf0084da3a71d"

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
