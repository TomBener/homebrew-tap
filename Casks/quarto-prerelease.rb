# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.9.20"
  sha256 "dde63985d34d80283c079df4cf43f5b1d5cd6ad5f5fd0e6b951bc4108f15476c"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.9.20/quarto-1.9.20-macos.pkg"
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
