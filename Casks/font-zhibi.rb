cask "font-zhibi" do
  version "3.26"
  sha256 "b848e7c9278b37df290fed54e36ae9016ed994792e81f98a4935ce5162661fac"

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
