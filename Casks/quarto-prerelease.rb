# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.10.5"
  sha256 "050022c0be74de7ccc6c00b510b5077c88c6935fdc767f2e46914d4ab36bb3a3"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.10.5/quarto-1.10.5-macos.pkg"
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
