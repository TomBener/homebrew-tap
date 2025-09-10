cask "font-xiaolai" do
  version "3.126"
  sha256 "e2f68daf0e72777a8cf58bc83de1b98634b251e537ddbfca24b0ae50d1802da2"

  url "https://github.com/lxgw/kose-font/releases/download/v3.126/Xiaolai-Regular.ttf", verified: "github.com/lxgw/kose-font/"
  name "Xiaolai"
  name "小赖字体"
  desc "Chinese handwriting font derived from SetoFont"
  homepage "https://github.com/lxgw/kose-font"

  font "Xiaolai-Regular.ttf"

  # No zap stanza required
end
