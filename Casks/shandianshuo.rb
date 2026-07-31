cask "shandianshuo" do
  version "0.7.7"
  sha256 "6d4f89fb8418355ba7595e0cb65ac874a444ffe26d25729c3190a836dc95d6cb"

  url "https://github.com/shandianshuo/shandianshuo-releases/releases/download/v#{version}/shandianshuo_#{version}_universal.dmg"
  name "闪电说"
  name "Shandianshuo"
  desc "AI voice input that transcribes and refines speech on-device"
  homepage "https://shandianshuo.cn/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "闪电说.app"

  uninstall quit: "cn.shandianshuo.desktop"

  zap trash: [
    "~/Library/Application Support/cn.shandianshuo.desktop",
    "~/Library/Caches/cn.shandianshuo.desktop",
    "~/Library/Preferences/cn.shandianshuo.desktop.plist",
    "~/Library/Saved Application State/cn.shandianshuo.desktop.savedState",
    "~/Library/WebKit/cn.shandianshuo.desktop",
  ]
end
