# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.7.11"
  sha256 "490c0242b4c5e5e2d88c23a9534b35625103f23589a6dfdef966a1820a1dcd6f"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.7.11/quarto-1.7.11-macos.pkg"
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
