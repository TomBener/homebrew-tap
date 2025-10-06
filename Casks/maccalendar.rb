cask "maccalendar" do
  version "1.0.2"
  sha256 "2380b6b3913a5e8424ca8194552672a1d6892c3db0b6053944ce7fb894c99239"

  url "https://github.com/bylinxx/MacCalendar/releases/download/v1.0.2/MacCalendar_1.0.2.dmg"
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
