# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.7.8"
  sha256 "3ced71f99b4bc964ab9aa1f3a3193099371c300473230afb6940f2ef1f44f8ef"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.7.8/quarto-1.7.8-macos.pkg",
      verified: "github.com/quarto-dev/quarto-cli"
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
