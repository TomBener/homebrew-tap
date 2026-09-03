# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.11.2"
  sha256 "1fce838b791545117c28c0f0e300a5d225b7595ea4c055bf3bcda0f1de7ffe1b"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.11.2/quarto-1.11.2-macos.pkg"
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
