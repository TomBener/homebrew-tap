# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.10.9"
  sha256 "bacae4913f6c445678654daf9783499335c21148d3a2732a9879c7c9115ef870"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.10.9/quarto-1.10.9-macos.pkg"
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
