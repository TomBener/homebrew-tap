cask "maccalendar" do
  version "1.4.4"
  sha256 "c9b824dd0989f220a4d70ad4334d03cafd5bebdee35c065f27a220da6b1b5c10"

  url "https://github.com/bylinxx/MacCalendar/releases/download/v1.4.4/MacCalendar_1.4.4.dmg"
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
