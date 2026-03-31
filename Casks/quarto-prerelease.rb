# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.10.1"
  sha256 "84f76692b8d17761bc78da493ae68b936e75f555d4e2b3e022dbc2489b5bb8e3"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.10.1/quarto-1.10.1-macos.pkg"
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
