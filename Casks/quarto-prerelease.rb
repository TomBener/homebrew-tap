# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.11.9"
  sha256 "35ad09e472235dc91638339d19891088531f9e2e77549dda2f7c210610e1b4d2"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.11.9/quarto-1.11.9-macos.pkg"
  name "quarto"
  desc "Scientific and technical publishing system built on Pandoc"
  homepage "https://www.quarto.org"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

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
