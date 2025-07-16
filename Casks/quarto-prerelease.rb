# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.8.17"
  sha256 "1c37c9433df6de109c04ed9dc4bc4a670a2737fb6d00ed276044299d67bc4f2b"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.8.17/quarto-1.8.17-macos.pkg"
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
