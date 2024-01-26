# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.5.4"
  sha256 "16c5fbe902dd3c96e64985e03d5e3befb29ce51d5fdda95a0350f0b4e4707634"

  url "https://github.com/quarto-dev/quarto-cli/releases/download/v#{version}/quarto-#{version}-macos.pkg",
      verified: "github.com/quarto-dev/quarto-cli/"
  name "quarto"
  desc "Scientific and technical publishing system built on Pandoc"
  homepage "https://www.quarto.org/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :el_capitan"

  pkg "quarto-#{version}-macos.pkg"

  # Create a symlink for Typst
  if Hardware::CPU.intel?
    binary "#{appdir}/quarto/bin/tools/x86_64/typst"
  else
    binary "#{appdir}/quarto/bin/tools/aarch64/typst"
  end

  uninstall pkgutil: "org.rstudio.quarto"

  zap trash: "~/Library/Caches/quarto"
end
