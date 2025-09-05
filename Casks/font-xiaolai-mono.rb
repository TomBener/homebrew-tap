cask "font-xiaolai-mono" do
  version "3.124"
  sha256 "ecf4eb4e72984425642e69a0c0675037d0dcd4d20007669a7e9a759e86eae41c"

  url "https://github.com/lxgw/kose-font/releases/download/v3.124/XiaolaiMono-Regular.ttf", verified: "github.com/lxgw/kose-font/"
  name "Xiaolai Mono"
  name "小赖字体等宽"
  desc "Chinese handwriting monospace font derived from SetoFont"
  homepage "https://github.com/lxgw/kose-font"

  font "XiaolaiMono-Regular.ttf"

  # No zap stanza required
end
