cask "maccalendar" do
  version "1.1.5"
  sha256 "06a2892699022a03d93024508044a8d9057e48369768aa048a80092a3160cd89"

  url "https://github.com/bylinxx/MacCalendar/releases/download/v1.1.5/MacCalendar_1.1.5.dmg"
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
