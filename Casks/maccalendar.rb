cask "maccalendar" do
  version "1.1.2"
  sha256 "b23a44190ca4816f303d6b42c29c291086dcd8b854108ce2c7838e2609ddade2"

  url "https://github.com/bylinxx/MacCalendar/releases/download/v1.1.2/MacCalendar_1.1.2.dmg"
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
