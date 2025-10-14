# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.9.5"
  sha256 "aac5bc1b7c3f04dea27c8a8a472b5c328012f5807b0f58bb8f2aad19a7ad59f6"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.9.5/quarto-1.9.5-macos.pkg"
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
