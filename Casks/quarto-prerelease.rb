# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.9.4"
  sha256 "60298f9ce7d7fe41a2ff6cd9e5f4c361878549c3b5fadaaae408260573ff538b"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.9.4/quarto-1.9.4-macos.pkg"
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
