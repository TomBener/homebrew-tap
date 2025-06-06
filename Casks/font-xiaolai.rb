cask "font-xiaolai" do
  version "3.121"
  sha256 "cc0acde1d1d44f4dee5c44c65384992b1c49ec9bc57537c5c82d6fb9c8f9346f"

  url "https://github.com/lxgw/kose-font/releases/download/v#{version}/Xiaolai-Regular.ttf", verified: "github.com/lxgw/kose-font/"
  name "Xiaolai"
  name "小赖字体"
  desc "Chinese handwriting font derived from SetoFont"
  homepage "https://github.com/lxgw/kose-font"

  font "Xiaolai-Regular.ttf"

  # No zap stanza required
end
