# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.9.9"
  sha256 "672ebf3d05d6d742aa5ac0676fb63a5c6c033382a8a32f7e8a97ecc2b348648d"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.9.9/quarto-1.9.9-macos.pkg"
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
