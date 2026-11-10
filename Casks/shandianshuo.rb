cask "shandianshuo" do
  arch arm: "arm64", intel: "x64"

  version "0.8.2"
  sha256 arm:   "0084ee59ce1fa0fc2a7a21da5254e6a215e939f0d7095224495be6537341cee7",
         intel: "a1d79f5879ba3afb692a3d9f29768aaf50c975d77a956191547aeadf945fac01"

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
