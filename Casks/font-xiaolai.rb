cask "font-xiaolai" do
  version "3.122"
  sha256 "5495088a6b74d7c01ab55188417ec396cb8b054b8f15193b54213c0c0560dd17"

  url "https://github.com/lxgw/kose-font/releases/download/v3.122/Xiaolai-Regular.ttf", verified: "github.com/lxgw/kose-font/"
  name "Xiaolai"
  name "小赖字体"
  desc "Chinese handwriting font derived from SetoFont"
  homepage "https://github.com/lxgw/kose-font"

  font "Xiaolai-Regular.ttf"

  # No zap stanza required
end
