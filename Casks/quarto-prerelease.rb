# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.10.14"
  sha256 "4b54e9652ff1e815fab55f0c8bbacf839bdc72be718c57c0fc088b2a5d19bb8e"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.10.14/quarto-1.10.14-macos.pkg"
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
