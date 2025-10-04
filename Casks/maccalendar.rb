cask "maccalendar" do
  version "1.0.1"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

  url "https://github.com/bylinxx/MacCalendar/releases/download/v#{version}/MacCalendar.zip"
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
