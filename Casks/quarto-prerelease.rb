# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.12.2"
  sha256 "12e82df18b77196945cbb1d0a3b2fc5493b3e11b7491dfb5089189baee495722"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.12.2/quarto-1.12.2-macos.pkg"
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
