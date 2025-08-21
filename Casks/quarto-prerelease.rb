# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.8.21"
  sha256 "ce39e69b8725a314c81cf3c9cc2f85629957fb86b1f5827d7e710013da22bff8"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.8.21/quarto-1.8.21-macos.pkg"
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
