# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.7.28"
  sha256 "686c1cc866ac0b1a3f4b6c4aaa87be8adbfd805c23f724b98e8e7f2b552b861e"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.7.28/quarto-1.7.28-macos.pkg"
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
