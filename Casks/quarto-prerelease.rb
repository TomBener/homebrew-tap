# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.9.31"
  sha256 "4f1ef20946cf2d7223fdafcab637cabcc07ce74c2bb7ba767e28a7834b6c0906"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.9.31/quarto-1.9.31-macos.pkg"
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
