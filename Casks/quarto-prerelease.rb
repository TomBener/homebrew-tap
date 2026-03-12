# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.9.32"
  sha256 "7f7185fd439f927abeb1b8fccf14a6c3ed3d64190b8b85c60da2bfd4a5609dfa"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.9.32/quarto-1.9.32-macos.pkg"
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
