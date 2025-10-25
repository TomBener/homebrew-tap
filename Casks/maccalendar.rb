cask "maccalendar" do
  version "1.1.1"
  sha256 "184967f73ff4e08790b0851d165d9d05eaa593967d1a74437f83caebc6bdaa74"

  url "https://github.com/bylinxx/MacCalendar/releases/download/v1.1.1/MacCalendar_1.1.1.dmg"
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
