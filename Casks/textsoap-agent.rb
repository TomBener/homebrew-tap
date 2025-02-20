cask "textsoap-agent" do
  version "9.3"
  sha256 :no_check

  url "https://textsoap.nyc3.digitaloceanspaces.com/files/textsoapAgent_latest.dmg"
  name "TextSoap Agent"
  desc "Companion app to integrate TextSoap with your favorite apps"
  homepage "https://textsoap.com"

  depends_on macos: ">= :catalina"

  auto_updates true

  preflight do
    unless system_command('ls', args: ['/Applications/textsoap9.app']).success?
      raise CaskError, "TextSoap must be installed before TextSoap Agent."
    end
  end

  app "textsoapAgent.app"

  uninstall quit: "com.unmarked.textsoap.agent"

  zap trash: [
    "~/Library/Preferences/com.unmarked.textsoap.agent.plist",
    "~/Library/Caches/com.apple.helpd/Generated/TextSoap Help*#{version.csv.first}",
    "~/Library/HTTPStorages/com.unmarked.textsoap.agent",
  ]
end
