# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.7.29"
  sha256 "4027cae5e3637577c2fa26bb99d2131fbbe406a29e9eb414861eec8bac86ea4a"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.7.29/quarto-1.7.29-macos.pkg"
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
