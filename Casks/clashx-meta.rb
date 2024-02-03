cask "clashx-meta" do
    version "1.3.10"
    sha256 :no_check
  
    url "https://github.com/MetaCubeX/ClashX.Meta/releases/download/v#{version}/ClashX.Meta.macOS.12.0+.zip"
    name "ClashX Meta"
    desc "A rule based proxy For Mac base on Clash"
    homepage "https://github.com/MetaCubeX/ClashX.Meta"
  
    livecheck do
      url "https://github.com/MetaCubeX/ClashX.Meta/releases"
      regex(%r{href=".*?/releases/tag/v?(\d+(?:\.\d+)+)"}i)
      strategy :page_match do |page, regex|
        page.scan(regex).flatten.uniq.sort
      end
    end
  
    auto_updates true
    depends_on macos: ">= :sierra"
  
    app "ClashX Meta.app"
  
    uninstall delete:    [
                "/Library/LaunchDaemons/com.metacubex.ClashX.ProxyConfigHelper.plist",
                "/Library/PrivilegedHelperTools/com.metacubex.ClashX.ProxyConfigHelper",
              ],
              launchctl: "com.metacubex.ClashX.ProxyConfigHelper",
              quit:      "com.metacubex.ClashX"
  
    zap trash: [
      "~/Library/Application Support/com.metacubex.ClashX.meta",
      "~/Library/Caches/com.metacubex.ClashX.meta",
      "~/Library/Logs/ClashX Meta",
      "~/Library/Preferences/com.metacubex.ClashX.meta.plist",
    ]
  end
