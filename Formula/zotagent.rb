class Zotagent < Formula
  desc "Zotero literature search CLI for AI agents"
  homepage "https://github.com/TomBener/zotagent"
  version "2026.11.24"
  url "https://github.com/TomBener/zotagent/releases/download/v2026.11.24/zotagent-2026.11.24.tgz"
  sha256 "cdeed0ddef6b808e1144241f9110e9b097e162f77ab66890e2c838165f1499f3"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "node"
  depends_on "openjdk"

  def install
    # Build native modules against Homebrew node's bundled headers.
    # Otherwise node-gyp downloads headers once per module in parallel,
    # and the race fails the build ("Completion callback never invoked").
    ENV["npm_config_nodedir"] = Formula["node"].opt_prefix
    system "npm", "install", "--omit=dev", *std_npm_args(ignore_scripts: false)
    (bin/"zotagent").write_env_script libexec/"bin/zotagent", Language::Java.overridable_java_home_env
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/zotagent help")
  end
end
