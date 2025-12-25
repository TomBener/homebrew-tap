# Formula code for installing the prerelease of Quarto

cask "quarto-prerelease" do
  version "1.9.16"
  sha256 "591dea7f941d6d41245a444f94e2d77451f60270592a57fe18a42db9582c500a"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.9.16/quarto-1.9.16-macos.pkg"
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
