# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.10.13"
  sha256 "29fa88c1b134d830de2e235cfc5599f1776340145d7b1eec8cc8f97b335d1f87"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.10.13/quarto-1.10.13-macos.pkg"
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
