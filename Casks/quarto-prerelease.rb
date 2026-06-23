# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.10.12"
  sha256 "d7d0dde13b67d6083b5ae2ecd9cba3507f4293e26d9536c2b17c28313ed36393"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.10.12/quarto-1.10.12-macos.pkg"
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
