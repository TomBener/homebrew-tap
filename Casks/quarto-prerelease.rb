# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.8.24"
  sha256 "951d55d43e99afa26c09289032d3e96f6c2b0a0967a0c6c5f7e7786c73b5fd9c"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.8.24/quarto-1.8.24-macos.pkg"
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
