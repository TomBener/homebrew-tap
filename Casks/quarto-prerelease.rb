# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.9.27"
  sha256 "fef0a409aabe66626483dcbd0b302b03de60c742b9dfcf6633d0bca219fa331d"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.9.27/quarto-1.9.27-macos.pkg"
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
