# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.9.35"
  sha256 "e52370783911592ec177a9a30534aa787f3f542dc65375155a820674ec85b8d8"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.9.35/quarto-1.9.35-macos.pkg"
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
