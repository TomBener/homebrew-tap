# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.9.7"
  sha256 "9c7cdecb9b252d8a68f17ca764e856b6d5cfc86f8bed957c2e544886e23753bd"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.9.7/quarto-1.9.7-macos.pkg"
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
