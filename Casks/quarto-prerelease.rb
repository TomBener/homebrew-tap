# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.10.17"
  sha256 "dadc8e95464563f2f10d8aebec5955b380d6fe07a899c506797337890adb2b20"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.10.17/quarto-1.10.17-macos.pkg"
  name "quarto"
  desc "Scientific and technical publishing system built on Pandoc"
  homepage "https://www.quarto.org"

  livecheck do
    url :url
    strategy :github_latest
  end

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
