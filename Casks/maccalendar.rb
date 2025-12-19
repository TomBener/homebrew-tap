cask "maccalendar" do
  version "1.1.8"
  sha256 "1e77d819c9a1a60386917ac63e5df15c5aae8d6d149fdd988262e027e7c6ef98"

  url "https://github.com/bylinxx/MacCalendar/releases/download/v1.1.8/MacCalendar_1.1.8.dmg"
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
