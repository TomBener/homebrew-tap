cask "maccalendar" do
  version "1.1.14"
  sha256 "375b36655ba9fa7f085b4e129549fe62b01cbd9baa0343cf1c34cdd240366087"

  url "https://github.com/bylinxx/MacCalendar/releases/download/v1.1.14/MacCalendar_1.1.14.dmg"
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
