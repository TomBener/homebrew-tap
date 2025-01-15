# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.7.10"
  sha256 "e0d98caa643feedecb33d6d4f480e791f83ff1df875328527e74cf90e79cb530"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.7.10/quarto-1.7.10-macos.pkg""github.com/quarto-dev/quarto-cli"
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
