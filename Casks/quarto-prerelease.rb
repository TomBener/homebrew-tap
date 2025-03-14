# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.7.17"
  sha256 "454d3c4139e2040d821d42b4de79d5f8bb5ac39ca982e3283f2a469cf437c668"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.7.17/quarto-1.7.17-macos.pkg"
  name "quarto"
  desc "Scientific and technical publishing system built on Pandoc"
  homepage "https://www.quarto.org"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :el_capitan"

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
