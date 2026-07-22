# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.10.16"
  sha256 "5c8d3240b23a7640eab3ea7b1249c783715bca8897fca52c7167365714c9626a"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.10.16/quarto-1.10.16-macos.pkg"
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
