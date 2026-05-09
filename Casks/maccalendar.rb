cask "maccalendar" do
  version "1.3.5"
  sha256 "e9c7450c288e1ae0417f9a37af38fd3a61560e0673ba5a2d316051d4175cec44"

  url "https://github.com/bylinxx/MacCalendar/releases/download/v1.3.5/MacCalendar_1.3.5.dmg"
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
