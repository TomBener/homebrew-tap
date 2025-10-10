cask "maccalendar" do
  version "1.0.3"
  sha256 "71c405c3e647d4e76a082fe3d0cfc7cf6a8bb5bbac544eed8979b17262081c21"

  url "https://github.com/bylinxx/MacCalendar/releases/download/v1.0.3/MacCalendar_1.0.3.dmg"
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
