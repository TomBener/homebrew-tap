# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.8.16"
  sha256 "88b59cba79d2848ca692bad4c035f4d031c6f69fa8ee81240658b85d16ebb48a"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.8.16/quarto-1.8.16-macos.pkg"
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
