# brew install --formula --build-from-source ~/Library/Mobile\ Documents/com~apple~CloudDocs/Install-macOS/Homebrew/Formula/bookget.rb
# brew upgrade --formula ~/Library/Mobile\ Documents/com~apple~CloudDocs/Install-macOS/Homebrew/Formula/bookget.rb

class Bookget < Formula
  desc "数字古籍图书下载工具"
  homepage "https://github.com/deweizhu/bookget"
  license "GPL-3.0"
  version "25.0512"

  livecheck do
    url :url
    strategy :github_latest
  end

        on_arm do
    url "https://github.com/deweizhu/bookget/releases/download/v25.0512/bookget-macos-arm64"
    sha256 "b00f4c68f01e109c51de5a02e7c55454aa2777529d1b345b24943ba77f4eaa15"
  end




        on_intel do
    url "https://github.com/deweizhu/bookget/releases/download/v25.0512/bookget-macos"
    sha256 "3112e760b53026993d6ff42efce7b98b335b844495765a192f9f2bc58ddd2a56"
  end




  def install
    bin.install Hardware::CPU.arm? ? "bookget-macos-arm64" : "bookget-macos" => "bookget"
  end
  end

  test do
    # The test will run `bookget -v` to verify the installation
    system "#{bin}/bookget", "-v"
  end
end
