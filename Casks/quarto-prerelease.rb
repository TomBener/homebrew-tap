# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.9.21"
  sha256 "c207dd493816238d955b18b9df04f671453caede0d603f5751bd1f13dbd8529a"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.9.21/quarto-1.9.21-macos.pkg"
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
