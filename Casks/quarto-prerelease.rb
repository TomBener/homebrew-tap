# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.7.18"
  sha256 "b60870b1edcd719f2e7712c956d9f9f8f28d0d98966e914b0ecc421a868d328a"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.7.18/quarto-1.7.18-macos.pkg"
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
