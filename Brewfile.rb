# The very first step for re-installing macOS is downloading & installing Surge or ClashX manually to proxy the network.
# Surge: https://dl.nssurge.com/mac/v4/Surge-latest.zip
# ClashX: ~/Library/Mobile Documents/com~apple~CloudDocs/Install-macOS/applications/ClashX.dmg

# Export
# `brew bundle dump`: Write all installed casks/formulae/images/taps into a Brewfile.

# Install Homebrew
# For general users
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## For users in Mainland China
# Option 1: 适合中国大陆用户使用的 Homebrew 应用代理镜像库 https://github.com/lzwme/homebrew-cn
# /bin/bash -c "$(curl -fsSL https://mirror.ghproxy.com/raw.githubusercontent.com/lzwme/homebrew-cn/HEAD/install.sh)"

# Option 2: Homebrew 中文网 https://brew.idayer.com
# /bin/bash -c "$(curl -fsSL https://gitee.com/ineo6/homebrew-install/raw/master/install.sh)"

# Install Homebrew Bundle
# 1. Copy Shell Export Command in Surge or ClashX, paste into Terminal and hit Enter.
# 2. `brew bundle --file ~/Library/Mobile\ Documents/com~apple~CloudDocs/Install-macOS/Homebrew/Brewfile.rb`: Install and upgrade (by default) all dependencies from `Brewfile.rb`.
# `brew bundle --help`: Show help messages.

# Third-party repositories
tap "homebrew/bundle"
tap "homebrew/cask-fonts"
tap "romkatv/powerlevel10k"  # powerlevel10k
tap "jez/formulae"  # pandoc-sidenote
tap "remove-bg/tap"  # removebg
tap "wader/tap"  # fq
tap "homebrew-x/x" # spotube
# tap "aljohri/-"  # docx2pdf
# tap "zph/cervezas"  # pdftk
# tap "ttscoff/thelab"
# tap "oven-sh/bun" # bun
# tap "1password/tap"  # 1password & 1password-cli
# tap "lencx/chatgpt"
# tap "lencx/nofwl"  # NoFWL (ChatGPT client)
# tap "homebrew/services"
# tap "homebrew/autoupdate"
# tap "pts/homebrew-utils"

# Alternative CLI tools & Plugins for Zsh
# E.g. Modern Unix: https://github.com/ibraheemdev/modern-unix
brew "bat"
brew "duf"
brew "fd"
brew "fzf"
# To install useful key bindings and fuzzy completion: `$(brew --prefix)/opt/fzf/install`
brew "eza"
brew "zoxide"
brew "zsh-autosuggestions"
brew "zsh-syntax-highlighting"
brew "powerlevel10k"

# Recommended libraries for `pyenv` https://github.com/pyenv/pyenv/wiki#suggested-build-environment
# Install Python 3.10.0 with `pyenv`: `env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install 3.10.0`
# R also requires `readline`, `xz`, `tcl-tk` etc.
brew "openssl"
brew "readline"
brew "sqlite"
brew "xz"
brew "tcl-tk"
# brew "zlib"

# Formulae
brew "moreutils"
brew "wget"
# brew "pandoc"
# `pandoc-crossref` depends on `pandoc` so `pandoc` will be installed automatically
brew "pandoc-crossref"
brew "pandoc-sidenote"
brew "hugo"
brew "tree"
brew "mas"
brew "pyenv"
brew "r"
brew "node"
brew "pnpm"
# brew "bun"
# brew "tag"
brew "ffmpeg"
brew "ocrmypdf"
brew "tesseract-lang"
brew "imagemagick"
brew "poppler"
brew "briss"
brew "mupdf"
brew "gifsicle"
brew "gifski"
# brew "docx2pdf"
brew "pdftk-java"
brew "autocorrect"
brew "fortune"
brew "zbar"
brew "rename"
brew "shellcheck"
brew "pwgen"
brew "translate-shell"
brew "onefetch"
brew "defaultbrowser"
# brew "checkmake"
brew "duti"
brew "gpg"
brew "neovim"
brew "gnu-sed"
brew "recode"
brew "ripgrep"
# brew "yadm"
brew "qrencode"
brew "rga"
brew "neofetch"
brew "removebg"
brew "jq"
brew "yq"
brew "telnet"
brew "yarn"
brew "youtube-dl"
brew "wgcf"
brew "ffsend"
brew "lychee"
brew "gh"
brew "git-lfs"
brew "exiftool"
brew "djvu2pdf"
brew "fq"
brew "clipboard"
brew "libpaper"
brew "cloudflared"
brew "vhs"
brew "pdfgrep"
brew "pdfrip"
brew "librsvg"
# brew "TheZoraiz/ascii-image-converter/ascii-image-converter"
# brew "gather-cli"
# brew "katana"
# brew "lua"
# brew "tldr"
# brew "pdfcpu"
# brew "fanyi"
# brew "flyctl"
# brew "mackup"
# brew "latexindent"
# brew "xdotool"
# brew "slides"
# brew "aria2"
# brew "pts/utils/sam2p"

# Casks
cask "setapp" # Comment if Setapp subscription is unavailable
# cask "bettertouchtool"
# cask "betterzip"
# cask "downie"
# cask "permute"
# cask "one-switch"
# cask "pdf-squeezer"
# cask "folx"
# Install 4.1 manually: brew install --cask https://raw.githubusercontent.com/Homebrew/homebrew-cask/9be98b75d567ffa19174c9ce18e1e1485cb7d20f/Casks/cleanshot.rb
# cask "cleanshot"

cask "dropbox"
cask "adguard"
cask "alfred"
cask "iterm2"
cask "karabiner-elements"
cask "keyboard-maestro"
cask "logseq"
cask "obsidian"
cask "github"
cask "visual-studio-code"
cask "google-chrome"
cask "firefox"
cask "applite"
cask "notion"
cask "lunar"
cask "pdf-expert"
cask "devonthink"
cask "historyhound"
cask "apparency"
cask "hazel"
cask "iina"
# cask "hookmark"
# cask "launchbar"
# cask "manila"
cask "pictogram"
cask "telegram"
cask "zotero"
cask "zight"
# cask "topnotch"
# cask "rstudio"
# cask "calibre"
cask "brooklyn"
cask "skim"
# cask "bunch"
# cask "chromedriver"
# cask "mailbutler"
cask "arc"
cask "kindavim"
cask "wooshy"
cask "yattee"
# cask "orion"
cask "paper"
# cask "cider"
# cask "tor-browser"
# cask "basictex"
cask "raycast"
cask "quarto"
# Typst is installed accompined with Quarto, use the folling command to add it to PATH:
# Apple Silicon Mac
    # sudo ln -s /Applications/quarto/bin/tools/aarch64/typst /usr/local/bin/typst
# Intel Mac
    # sudo ln -s /Applications/quarto/bin/tools/x86_64/typst  /usr/local/bin/typst
cask "spotube"
cask "markdown-service-tools"
cask "cloudflare-warp"
cask "netnewswire"
cask "1password"
cask "heynote"
cask "pile"
cask "picgo"
cask "orbstack"
cask "inkscape"
cask "adobe-acrobat-pro"
# cask "coconutbattery"
# cask "1password-cli"
# cask "chatgpt"
# cask "nofwl"
# cask "squirrel"
# cask "bitwarden"
# cask "tickeys"
# cask "progressive-downloader"
# cask "vimr"
# cask "input-source-pro"
# cask "docker"
# cask "popmaker"
# cask "microsoft-edge"
# cask "firefox"
# cask "marked"
# cask "typora"
# cask "bike"
# cask "koodo-reader"
cask "mactex-no-gui"

# Fonts for ASCII
cask "font-jetbrains-mono"
cask "font-jetbrains-mono-nerd-font"
cask "font-linux-libertine"
cask "font-latin-modern-math"
cask "font-input"
cask "font-iosevka"
cask "font-ia-writer-mono"
cask "font-fira-code"
cask "font-noto-serif"
cask "font-hack-nerd-font"
cask "font-intel-one-mono"
cask "font-monaspace"
cask "font-inter"
# cask "font-mona-sans"
# cask "font-hubot-sans"
# Fonts for Chinese
cask "font-noto-serif-cjk-sc"
cask "font-noto-sans-cjk-sc"
cask "font-lxgw-wenkai"
cask "font-lxgw-neoxihei"
cask "font-zhuque-fangsong"
cask "font-maple"
# cask "font-chenyuluoyan"
# cask "font-hanamina"

# Apps from Mac App Store
# U.S. account
mas "1Password for Safari", id: 1569813296
mas "Bob", id: 1630034110
mas "Craft", id: 1487937127
mas "Drafts", id: 1435957248
# mas "Zight", id: 417602904
# mas "MD Clock", id: 1536358464
# mas "PopClip", id: 445189367
# mas "scite", id: 1551820111
mas "Spark", id: 1176895641
mas "Noir", id: 1592917505
mas "Save to Reader", id: 1640236961
mas "Pages", id: 409201541
mas "Numbers", id: 409203825
mas "Keynote", id: 409183694
mas "Microsoft Word", id: 462054704
mas "Microsoft Excel", id: 462058435
mas "Microsoft PowerPoint", id: 462062816
mas "SingleFile for Safari", id: 6444322545
mas "Wayback Machine", id: 1472432422
mas "OpenCat", id: 6445999201
mas "Vimkey", id: 1585682577
mas "Hush Nag Blocker", id: 1544743900
mas "Refined GitHub", id: 1519867270
mas "Whisper Transcription", id: 1668083311
# mas "TinyStudio", id: 6448954288
# mas "OneDrive", id: 823766827
# mas "DockX", id: 6452276577
# mas "Cascadea", id: 1432182561
# mas "Mastonaut", id: 1450757574
# mas "Juice for Spotify & Music App", id: 1478610778
# mas "Telegram Lite", id: 946399090
# mas "Matter", id: 1548677272
# mas "Save to Raindrop.io", id: 1549370672
# mas "PDF Viewer", id: 1120099014
# mas "Paste", id: 967805235
# mas "FBReader: ePub and fb2 reader", id: 1067172178

# Mainland China account
# mas "HazeOver", id: 430798174
# mas "i-Picker", id: 1556461417
mas "iA Writer", id: 775737590
mas "iPreview", id: 1519213509
mas "Pixelmator Pro", id: 1289583905
mas "Vinegar", id: 1591303229
mas "Gifski", id: 1351639930
# mas "Soulver", id: 1508732804
# mas "GIF Brewery 3", id: 1081413713
# mas "Affinity Publisher", id: 881418622
# mas "Magnet", id: 441258766
# mas "Wallpaper Wizard", id: 1266674560
