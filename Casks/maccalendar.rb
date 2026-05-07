cask "maccalendar" do
  version "1.3.3"
  sha256 "9994b429c04955373fe1eb8bc24b864213ab6b8943c4548f168641282e4b08e7"

  url "https://github.com/bylinxx/MacCalendar/releases/download/v1.3.3/MacCalendar_1.3.3.dmg"
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
