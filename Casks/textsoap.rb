cask "textsoap" do
  version "latest"
  sha256 :no_check

  url "https://textsoap.nyc3.digitaloceanspaces.com/files/textsoap9_latest.dmg"
  name "TextSoap"
  desc "Powerful text transformations with just a click"
  homepage "https://textsoap.com"

  depends_on macos: ">= :big_sur"

  auto_updates true

  app "textsoap9.app"

  uninstall quit: "com.unmarked.textsoap9"

  zap trash: [
    "~/Library/Application Support/Textsoap",
    "~/Library/Application Support/textsoap9",
    "~/Library/Preferences/com.unmarked.textsoap9.plist",
    "~/Library/Caches/com.unmarked.textsoap9",
    "~/Library/Caches/com.apple.helpd/Generated/TextSoap Help*#{version.csv.first}",
    "~/Library/HTTPStorages/com.unmarked.textsoap9",
  ]
end
