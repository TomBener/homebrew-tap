# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.8.4"
  sha256 "dc77e09f3ef18ce83ef06d34616e5485b3a34b7d2f6ead3773939827155ccbde"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.8.4/quarto-1.8.4-macos.pkg"
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
