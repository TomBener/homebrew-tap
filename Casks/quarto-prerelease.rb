# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.12.0"
  sha256 "65a53e1f6bbbe16a343ea165f109d05d51956800ce2fbb42cf06a33342e0e547"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.12.0/quarto-1.12.0-macos.pkg"
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
