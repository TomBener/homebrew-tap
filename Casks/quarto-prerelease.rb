# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.8.18"
  sha256 "68f0f3a320847a0d6eade9e75fa282671ee0c97138c3d1fbb0ac633c9398cd9f"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.8.18/quarto-1.8.18-macos.pkg"
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
