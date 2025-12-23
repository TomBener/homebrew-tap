cask "maccalendar" do
  version "1.1.10"
  sha256 "4db6752c1c22fd9912618508187ae711731d3c3576a47ad8aba25383f93473b5"

  url "https://github.com/bylinxx/MacCalendar/releases/download/v1.1.10/MacCalendar_1.1.10.dmg"
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
