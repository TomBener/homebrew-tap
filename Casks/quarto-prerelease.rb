# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.7.23"
  sha256 "371b2bc81ce99c5a3efd826c603e1d36da6193ea6ef2f844b2a19d90494d94fd"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.7.23/quarto-1.7.23-macos.pkg"
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
