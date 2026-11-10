cask "font-zhibi" do
  version "3.28"
  sha256 "d0ae30f2fa4aa870de8aad9a91fa969066e6e7fd504327f74b0e5647c19b9bbb"

  url "https://zhibi.fun/downloads/zhibi-v#{version}.zip"
  name "Zhibi"
  name "稚笔"
  desc "Chinese childlike handwriting font"
  homepage "https://zhibi.fun/"

  livecheck do
    url :homepage
    regex(/zhibi\.woff2\?v=(\d+(?:\.\d+)+)/i)
  end

  font "稚笔.ttf"

  zap :not_required
end
