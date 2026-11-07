cask "shandianshuo" do
  arch arm: "arm64", intel: "x64"

  version "0.8.1"
  sha256 arm:   "1e401338973645365b2a15bbd938a946722e703cec8cb50ee7eeb240912b5cf4",
         intel: "5f58f5182bfeb1892809b96f91362474896cdfbb37b445ce03da4c11e5ba25c0"

  url "https://github.com/shandianshuo/shandianshuo-releases/releases/download/v#{version}/shandianshuo_#{version}_#{arch}.dmg"
  name "闪电说"
  name "Shandianshuo"
  desc "AI voice input that transcribes and refines speech on-device"
  homepage "https://shandianshuo.cn/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

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
