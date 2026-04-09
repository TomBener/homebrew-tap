# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.10.2"
  sha256 "6b956b821c2638ed123199662b57ad78d0b1b0c2cd6fdacb9e3d9ef65e2d4877"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.10.2/quarto-1.10.2-macos.pkg"
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
