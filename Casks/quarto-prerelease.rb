# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.9.26"
  sha256 "f291bb1c17b5ae221d16c50abf67008abe00eeb50aa566d8716eb56d50beee1a"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.9.26/quarto-1.9.26-macos.pkg"
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
