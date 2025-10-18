# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.9.8"
  sha256 "5af4ec92cfedb4f8a462540ae2406947ed414fbab2c0a6336b56fbb46a65bdbf"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.9.8/quarto-1.9.8-macos.pkg"
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
