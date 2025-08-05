# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.8.19"
  sha256 "7a99bed44c0b82438064309ecd80d8523ca9e81476eb8851f9978ee47eb5ae53"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.8.19/quarto-1.8.19-macos.pkg"
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
