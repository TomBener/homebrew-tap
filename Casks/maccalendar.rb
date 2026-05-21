cask "maccalendar" do
  version "1.4.2"
  sha256 "83f79a46304806ec05effabb3b2432a033f4e9c930a3596167914fdb58614093"

  url "https://github.com/bylinxx/MacCalendar/releases/download/v1.4.2/MacCalendar_1.4.2.dmg"
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
