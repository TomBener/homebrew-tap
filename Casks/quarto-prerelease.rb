# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.9.0"
  sha256 "cb1fd0a3f9a73b1f29e5dff1eb2ca1837ab20bdc6b743c1083f30392220538ad"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.9.0/quarto-1.9.0-macos.pkg"
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
