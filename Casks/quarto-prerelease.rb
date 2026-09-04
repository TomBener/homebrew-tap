# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.11.3"
  sha256 "2f1ca049b111a214d56285f914a7b7ec1892efd45eddc9bdd3f05892bc8fef65"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.11.3/quarto-1.11.3-macos.pkg"
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
