cask "maccalendar" do
  version "1.3.1"
  sha256 "994149cdb6aecc22db8f4a4f3394ace32027cad2bdac3e80551a96da7177fe72"

  url "https://github.com/bylinxx/MacCalendar/releases/download/v1.3.1/MacCalendar_1.3.1.dmg"
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
