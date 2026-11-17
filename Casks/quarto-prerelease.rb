# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.12.3"
  sha256 "5225c0b491527dab2851fa4b44aa3c5f11cd5e3d2cf5bc9000f5c822426805e2"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.12.3/quarto-1.12.3-macos.pkg"
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
