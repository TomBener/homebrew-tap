class Zotagent < Formula
  desc "Zotero literature search CLI for AI agents"
  homepage "https://github.com/TomBener/zotagent"
  version "2026.8.25"
  url "https://github.com/TomBener/zotagent/releases/download/v2026.8.25/zotagent-2026.8.25.tgz"
  sha256 "fb507fa53eea89a2ab84d769565408e5b68f265bbe9f2d25cce0eb85a7ad3faf"

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
