# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.7.26"
  sha256 "7b03669822f3f38f6bf443dfb95db69e1e9152ce3a8c86fe1fb675330c163a31"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.7.26/quarto-1.7.26-macos.pkg"
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
