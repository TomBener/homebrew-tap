# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.9.14"
  sha256 "9d67b9296614dff086f984d254213d7c642c5b044ab207a375f748478a6c35c1"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.9.14/quarto-1.9.14-macos.pkg"
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
