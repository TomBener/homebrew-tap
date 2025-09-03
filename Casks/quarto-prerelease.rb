# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.8.23"
  sha256 "81a8dc501898643054b501ef2e7b66879cddc216314d3353c416abe1bb5da23e"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.8.23/quarto-1.8.23-macos.pkg"
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
