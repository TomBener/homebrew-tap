# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.9.3"
  sha256 "1624205881b5ce04eb1a0721b89d62950a2c694a793736f317d8ca927b667a7e"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.9.3/quarto-1.9.3-macos.pkg"
  name "quarto"
  desc "Scientific and technical publishing system built on Pandoc"
  homepage "https://www.quarto.org"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :el_capitan"

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
