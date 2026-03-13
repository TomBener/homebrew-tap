# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.9.34"
  sha256 "aab73fa825ff1a1f1b39abbf6d4ba77b05df897dcb885636cadf7cc5bc3d6677"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.9.34/quarto-1.9.34-macos.pkg"
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
