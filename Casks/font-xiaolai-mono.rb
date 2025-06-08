cask "font-xiaolai-mono" do
  version "3.122"
  sha256 "7ab333d4eca52f7b32ca6230eb0a6b80c1bf0dff71398339b9e53abfee2c18e2"

  url "https://github.com/lxgw/kose-font/releases/download/v3.122/XiaolaiMono-Regular.ttf", verified: "github.com/lxgw/kose-font/"
  name "Xiaolai Mono"
  name "小赖字体等宽"
  desc "Chinese handwriting monospace font derived from SetoFont"
  homepage "https://github.com/lxgw/kose-font"

  font "XiaolaiMono-Regular.ttf"

  # No zap stanza required
end
