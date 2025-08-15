# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.8.20"
  sha256 "43f16bd1cceca27e80bf4093f4d3682c22e5ddc8f1a8d704661f4cebce51ef8c"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.8.20/quarto-1.8.20-macos.pkg"
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
