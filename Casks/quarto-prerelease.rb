# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.9.13"
  sha256 "d9ce36224c1c5e4b1569301de4abfaa1d52acee97cbcd7ed543e121fd3d02872"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.9.13/quarto-1.9.13-macos.pkg"
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
