# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.9.11"
  sha256 "afe3e7be4300f57b87815500dd91b420872067aac19023a9859a268f013b5660"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.9.11/quarto-1.9.11-macos.pkg"
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
