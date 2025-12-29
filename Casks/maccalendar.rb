cask "maccalendar" do
  version "1.1.12"
  sha256 "8854475e29ec622e26e5afa6934029a5de012b06d3faefae374fafc723e6e73c"

  url "https://github.com/bylinxx/MacCalendar/releases/download/v1.1.12/MacCalendar_1.1.12.dmg"
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
