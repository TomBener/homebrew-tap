cask "font-xiaolai-mono" do
  version "3.123"
  sha256 "245025e48696a49c6bec816deb73070caab2203a1c204d977aa4f88a9e87932d"

  url "https://github.com/lxgw/kose-font/releases/download/v3.123/XiaolaiMono-Regular.ttf", verified: "github.com/lxgw/kose-font/"
  name "Xiaolai Mono"
  name "小赖字体等宽"
  desc "Chinese handwriting monospace font derived from SetoFont"
  homepage "https://github.com/lxgw/kose-font"

  font "XiaolaiMono-Regular.ttf"

  # No zap stanza required
end
