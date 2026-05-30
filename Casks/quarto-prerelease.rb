# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.10.6"
  sha256 "ec4d3a667763b56fa931dc6db45fcdf402718197ab45d0f954cd5bac96959028"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.10.6/quarto-1.10.6-macos.pkg"
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
