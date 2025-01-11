# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.7.9"
  sha256 "aa560565fc726d43207cd23645bc57544d32a6992d2f06d8b6f5c067c51bc1b8"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.7.9/quarto-1.7.9-macos.pkg",
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.7.8/quarto-1.7.8-macos.pkg",
      verified: "github.com/quarto-dev/quarto-cli"
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
