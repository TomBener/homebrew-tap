# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.7.20"
  sha256 "52e30d3416dccace894394cbab0aaf513399e2c7c6cc1ac07355c24f4308d782"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.7.20/quarto-1.7.20-macos.pkg"
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
