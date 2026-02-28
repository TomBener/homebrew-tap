cask "maccalendar" do
  version "1.1.15"
  sha256 "fed1a2aa18b28703ce54d89d2789f249dc19ee6dd01f11bd313fa43e771b6fd8"

  url "https://github.com/bylinxx/MacCalendar/releases/download/v1.1.15/MacCalendar_1.1.15.dmg"
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
