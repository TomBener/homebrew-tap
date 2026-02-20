# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.9.23"
  sha256 "6d25f0c2966baeeaa26d6d5ecaa329c998004db3f9a77ad09c7bc1dfca1dbf33"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.9.23/quarto-1.9.23-macos.pkg"
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
