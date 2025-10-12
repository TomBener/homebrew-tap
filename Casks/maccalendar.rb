cask "maccalendar" do
  version "1.1.0"
  sha256 "1ce4b0955545a41f2b8782e4a9756e8f9d08b195a79eaea4b377b39aefa4ef66"

  url "https://github.com/bylinxx/MacCalendar/releases/download/v1.1.0/MacCalendar_1.1.0.dmg"
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
