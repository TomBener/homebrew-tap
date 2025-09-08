cask "font-xiaolai-mono" do
  version "3.125"
  sha256 "fa28b6d38d44686c2927f604d10951c6f6c8cf4979e877508b7bf624b5c36e21"

  url "https://github.com/lxgw/kose-font/releases/download/v3.125/XiaolaiMono-Regular.ttf", verified: "github.com/lxgw/kose-font/"
  name "Xiaolai Mono"
  name "小赖字体等宽"
  desc "Chinese handwriting monospace font derived from SetoFont"
  homepage "https://github.com/lxgw/kose-font"

  font "XiaolaiMono-Regular.ttf"

  # No zap stanza required
end
