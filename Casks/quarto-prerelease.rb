# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.9.15"
  sha256 "d63bc0e7e45396397efef08615f5c7e1cd9ad99077fc24937201b255c1ad5a4c"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.9.15/quarto-1.9.15-macos.pkg"
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
