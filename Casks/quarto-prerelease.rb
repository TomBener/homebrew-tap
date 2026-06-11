# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.10.11"
  sha256 "365bfc8afc58f8fe8a4c5f817a0798e57c6226368211d538b720a15cefd1d629"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.10.11/quarto-1.10.11-macos.pkg"
  name "quarto"
  desc "Scientific and technical publishing system built on Pandoc"
  homepage "https://www.quarto.org"

  livecheck do
    url :url
    strategy :github_latest
  end

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
