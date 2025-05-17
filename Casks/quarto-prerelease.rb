# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.8.7"
  sha256 "aa461705408f5bb8413d3318cac28a02f39d8abe07a565497e5362508107a082"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.8.7/quarto-1.8.7-macos.pkg"
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
