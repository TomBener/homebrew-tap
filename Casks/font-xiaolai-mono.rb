cask "font-xiaolai-mono" do
  version "3.126"
  sha256 "802b658db492e02ae5b659f5b56d7d4ef8f77609515bdcc82f462ae912888c33"

  url "https://github.com/lxgw/kose-font/releases/download/v3.126/XiaolaiMono-Regular.ttf", verified: "github.com/lxgw/kose-font/"
  name "Xiaolai Mono"
  name "小赖字体等宽"
  desc "Chinese handwriting monospace font derived from SetoFont"
  homepage "https://github.com/lxgw/kose-font"

  font "XiaolaiMono-Regular.ttf"

  # No zap stanza required
end
