cask "font-xiaolai" do
  version "3.125"
  sha256 "1778f1f4d1baf9483fc7435a88bba1e0a04fcea7fad4e7b297b0e41774d3cfb3"

  url "https://github.com/lxgw/kose-font/releases/download/v3.125/Xiaolai-Regular.ttf", verified: "github.com/lxgw/kose-font/"
  name "Xiaolai"
  name "小赖字体"
  desc "Chinese handwriting font derived from SetoFont"
  homepage "https://github.com/lxgw/kose-font"

  font "Xiaolai-Regular.ttf"

  # No zap stanza required
end
