cask "font-fangsong-gb2312" do
  version "1.0"
  sha256 "e6872501e1a86a7e88395ee51a0bc83f67c24d533bca886f0f5c65f7c4fcbf7c"

  url "https://github.com/TomBener/homebrew-tap/releases/download/#{version}/FangSong_GB2312.ttf"
  name "Fangzheng Fangsong GB2312"
  desc "Legacy Chinese font called Fangsong for the GB2312 encoding"
  homepage "https://github.com/TomBener/homebrew-tap"

  font "FangSong_GB2312.ttf"

  # no zap stanza required
end
