# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.8.14"
  sha256 "38be559ba29a0f81e272231c0ab100179fec3bc789647a39141b1c9238884fa8"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.8.14/quarto-1.8.14-macos.pkg"
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
