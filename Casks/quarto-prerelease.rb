# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.11.6"
  sha256 "f3c7272b6e927a6b7a23bd316a5d4c58b416753d53de61b10a88e42df2cb67f6"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.11.6/quarto-1.11.6-macos.pkg"
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
