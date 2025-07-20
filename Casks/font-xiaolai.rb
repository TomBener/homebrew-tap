cask "font-xiaolai" do
  version "3.123"
  sha256 "42f850f540a8a94969b5c53d3218172c229fdb18ceba49ce9ae104c7d0fe365d"

  url "https://github.com/lxgw/kose-font/releases/download/v3.123/Xiaolai-Regular.ttf", verified: "github.com/lxgw/kose-font/"
  name "Xiaolai"
  name "小赖字体"
  desc "Chinese handwriting font derived from SetoFont"
  homepage "https://github.com/lxgw/kose-font"

  font "Xiaolai-Regular.ttf"

  # No zap stanza required
end
