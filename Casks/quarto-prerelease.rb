# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.10.7"
  sha256 "ab81540a666d2f06199e98a37b9c9565f242de70f6476878186c9eadd0b39099"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.10.7/quarto-1.10.7-macos.pkg"
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
