# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.7.22"
  sha256 "5d024fa44bb14edb35a4f8805262ec36a86c9670c7858a7e6489fd135d36b80c"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.7.22/quarto-1.7.22-macos.pkg"
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
