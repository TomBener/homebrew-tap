# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.11.4"
  sha256 "048617307d5a8a1901cd53b3245eccf37d236b728c6eeae01e2fffe4b0d4271d"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.11.4/quarto-1.11.4-macos.pkg"
  name "quarto"
  desc "Scientific and technical publishing system built on Pandoc"
  homepage "https://www.quarto.org"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

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
