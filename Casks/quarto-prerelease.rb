# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.7.14"
  sha256 "b003c7feaf74950d7ca5b91c868a6104b2348d035c256c80fd85777e0b792fb0"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.7.14/quarto-1.7.14-macos.pkg"
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
