cask "font-zhibi" do
  version "3.27"
  sha256 "293665dadd7f77cf79a7c72314e413cb50de7e64fcd8701ec8abc9031a5b03e5"

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
