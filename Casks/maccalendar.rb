cask "maccalendar" do
  version "1.1.3"
  sha256 "6b69fa45f0ea7a3d2711cb18d69b6b768b76c441ec7064b7457a9cae9644651f"

  url "https://github.com/bylinxx/MacCalendar/releases/download/v1.1.3/MacCalendar_1.1.3.dmg"
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
