cask "font-kaiti-gb2312" do
  version "1.0"
  sha256 "faa9b16c38dba8da9a8b43e488b2cc2f6ddfb1106231367d331a30046a8da718"

  url "https://github.com/TomBener/homebrew-tap/releases/download/v#{version}/Kaiti_GB2312.ttf"
  name "Fangzheng Kaiti GB2312"
  desc "Legacy Chinese font called Kaiti for the GB2312 encoding"
  homepage "https://github.com/TomBener/homebrew-tap"

  font "Kaiti_GB2312.ttf"

  # no zap stanza required
end
