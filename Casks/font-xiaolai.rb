cask "font-xiaolai" do
  version "3.124"
  sha256 "501a47f5e82d4029d2f9ee47532ce6fbb25e49ec7bf6d52c1d9f5b72971294af"

  url "https://github.com/lxgw/kose-font/releases/download/v3.124/Xiaolai-Regular.ttf", verified: "github.com/lxgw/kose-font/"
  name "Xiaolai"
  name "小赖字体"
  desc "Chinese handwriting font derived from SetoFont"
  homepage "https://github.com/lxgw/kose-font"

  font "Xiaolai-Regular.ttf"

  # No zap stanza required
end
