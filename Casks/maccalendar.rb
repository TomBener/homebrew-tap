cask "maccalendar" do
  version "1.4.3"
  sha256 "cac85f0a44b8249bf5cbaf79cce276c418b8e0471b849c6d480be6a5af16bb58"

  url "https://github.com/bylinxx/MacCalendar/releases/download/1.4.3/MacCalendar_1.4.3.dmg"
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
