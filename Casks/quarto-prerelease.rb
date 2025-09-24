# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.9.2"
  sha256 "66cd420746c73f231ac26b2bfc0ff94a262525af54a61da4def02386c457d341"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.9.2/quarto-1.9.2-macos.pkg"
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
