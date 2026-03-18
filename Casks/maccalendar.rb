cask "maccalendar" do
  version "1.1.16"
  sha256 "59523e61fcac07864d550fa9929fe9c46a30364d64a6a0c4fba0878b35d34d35"

  url "https://github.com/bylinxx/MacCalendar/releases/download/v1.1.16/MacCalendar_1.1.16.dmg"
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
