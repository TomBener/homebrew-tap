cask "shandianshuo" do
  version "0.7.5"
  sha256 "9f50ea578e3225981308b2d9b13e6716c518805680eb57c473a148c553299723"

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
