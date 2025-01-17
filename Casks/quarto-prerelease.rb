# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.7.13"
  sha256 "ee24e08583d32d75591c6e5a75f09acf1d84b8b36c460a864c96a6a17758f77e"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.7.13/quarto-1.7.13-macos.pkg"
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
