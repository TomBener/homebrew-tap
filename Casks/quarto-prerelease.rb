# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.9.22"
  sha256 "a1cd8bce0ea56b9eea082c7efbdd0ce45af0b5d5fa8ef5afb37032898ef6e963"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.9.22/quarto-1.9.22-macos.pkg"
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
