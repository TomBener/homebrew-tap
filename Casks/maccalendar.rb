cask "maccalendar" do
  version "1.3.6"
  sha256 "f381e8cae934412742bcca5dc333fc6e5d4566ff4349578f820999cf8db8d7ae"

  url "https://github.com/bylinxx/MacCalendar/releases/download/v1.3.6/MacCalendar_1.3.6.dmg"
  name "MacCalendar"
  desc "macOS menu bar calendar app supporting Chinese lunar calendar, holidays, and system events"
  homepage "https://github.com/bylinxx/MacCalendar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"

  app "MacCalendar.app"

  zap trash: [
    "~/Library/Application Support/MacCalendar",
    "~/Library/Caches/MacCalendar",
    "~/Library/Preferences/com.bylinxx.MacCalendar.plist",
  ]
end
