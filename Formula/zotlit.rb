class Zotlit < Formula
  desc "Zotero literature search CLI for AI agents"
  homepage "https://github.com/TomBener/zotlit"
  version "0.1.0"
  url "https://github.com/TomBener/zotlit/releases/download/v0.1.0/zotlit-0.1.0.tgz"
  sha256 "0808b75e02e959d4f25f99a0ec5130e74c8eb9b9380a325ab996d22aa0d63127"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "node"
  depends_on "openjdk"

  def install
    system "npm", "install", "--omit=dev", *std_npm_args
    bin.env_script_all_files libexec/"bin", Language::Java.overridable_java_home_env
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/zotlit help")
  end
end
