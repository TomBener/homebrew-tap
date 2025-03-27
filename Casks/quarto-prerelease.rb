# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.7.19"
  sha256 "8875fefbc9741a92ccae4fec7b3e8579283e3f83b84554ce4b52bd344b1b665b"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.7.19/quarto-1.7.19-macos.pkg"
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
