cask "maccalendar" do
  version "1.3.2"
  sha256 "3cbb87e9a70ae86477dd8a77c73d6d8976b545201ce8d84410e65e715eea6ed2"

  url "https://github.com/bylinxx/MacCalendar/releases/download/v1.3.2/MacCalendar_1.3.2.dmg"
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
