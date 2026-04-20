class Zotagent < Formula
  desc "Zotero literature search CLI for AI agents"
  homepage "https://github.com/TomBener/zotagent"
  version "0.21.0"
  url "https://github.com/TomBener/zotagent/releases/download/v0.21.0/zotagent-0.21.0.tgz"
  sha256 "7f152d9f5c4b7d09f095e8b0900b377dd89d38b0c5a5e46079c1426afb49e842"

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
