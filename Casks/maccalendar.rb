cask "maccalendar" do
  version "1.1.13"
  sha256 "72079a409c70632f77b7459b2372e36862bc7ff60cb16c53f8e007ad5ec6a373"

  url "https://github.com/bylinxx/MacCalendar/releases/download/v1.1.13/MacCalendar_1.1.13.dmg"
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
