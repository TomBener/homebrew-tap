cask "font-xiaolai-mono" do
  version "3.121"
  sha256 "8c3dbf17ca1cedbe4909ac1fb5616a9b0874597861332f4cf9f847c54d0be3ea"

  url "https://github.com/lxgw/kose-font/releases/download/v#{version}/XiaolaiMono-Regular.ttf", verified: "github.com/lxgw/kose-font/"
  name "Xiaolai Mono"
  name "小赖字体等宽"
  desc "Chinese handwriting monospace font derived from SetoFont"
  homepage "https://github.com/lxgw/kose-font"

  font "XiaolaiMono-Regular.ttf"

  # No zap stanza required
end
