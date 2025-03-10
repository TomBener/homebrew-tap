# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.7.15"
  sha256 "6855387ea67e7b5109fee16455a47d10b189a657ed305b025f46f222c1d5f1e6"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.7.15/quarto-1.7.15-macos.pkg"
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
