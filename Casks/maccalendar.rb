cask "maccalendar" do
  version "1.4.0"
  sha256 "41836fe8f73f80c6e92365d539319c0d991147a5d3af1119437b9581104430ae"

  url "https://github.com/bylinxx/MacCalendar/releases/download/v1.4.0/MacCalendar_1.4.0.dmg"
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
