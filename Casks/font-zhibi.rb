cask "font-zhibi" do
  version "3.25"
  sha256 "1a959c5f5e905ad5017f30807483cd4b81a96073d2d906bab4f246eb4feeecba"

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
