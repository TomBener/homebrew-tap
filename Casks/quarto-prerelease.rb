# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.10.8"
  sha256 "126fe4e84fc03f95deae2be3fcc60007a3996cf93c20e54c5f7e85bc82ad86f1"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.10.8/quarto-1.10.8-macos.pkg"
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
