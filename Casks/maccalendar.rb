cask "maccalendar" do
  version "1.1.6"
  sha256 "81c74ca9e182769e6223c7bc2e1afb26ba1d90b8f598dc4712c19f60ea44e1b6"

  url "https://github.com/bylinxx/MacCalendar/releases/download/v1.1.6/MacCalendar_1.1.6.dmg"
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
