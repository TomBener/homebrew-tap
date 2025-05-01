# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.8.1"
  sha256 "bd43d065e6d6173c425ed6ac9bddb5102fd0fe108a73d103f9e04f7070e535ed"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.8.1/quarto-1.8.1-macos.pkg"
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
