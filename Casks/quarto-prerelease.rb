# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.9.12"
  sha256 "e325610ed26398d6ee1beb05f4ae870c8810c7082160d20f76cd22df23cf7ea1"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.9.12/quarto-1.9.12-macos.pkg"
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
