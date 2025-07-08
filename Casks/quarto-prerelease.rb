# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.8.15"
  sha256 "5c0d0372cbeecc1f882d8a302bcad676d1c5d643c5b2cefb26195546cef39dfe"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.8.15/quarto-1.8.15-macos.pkg"
  name "quarto"
  desc "Scientific and technical publishing system built on Pandoc"
  homepage "https://www.quarto.org"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :el_capitan"

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
