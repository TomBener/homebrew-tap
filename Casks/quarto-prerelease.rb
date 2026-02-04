# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.9.19"
  sha256 "f0f040aabd71f3e9814ba0b8191f27cf8228ef5f740ae8cb6f037a48240e318b"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.9.19/quarto-1.9.19-macos.pkg"
  name "quarto"
  desc "Scientific and technical publishing system built on Pandoc"
  homepage "https://www.quarto.org"

  livecheck do
    url :url
    strategy :github_latest
  end

  pkg "quarto-#{version}-macos.pkg"

  # Create a symlink for Typst
  # if Hardware::CPU.intel?
  #   binary "#{appdir}/quarto/bin/tools/x86_64/typst"
  # else
  #   binary "#{appdir}/quarto/bin/tools/aarch64/typst"
  # end

  uninstall pkgutil: "org.rstudio.quarto"

  zap trash: "~/Library/Caches/quarto"
end
