# The very first step for re-installing macOS is downloading & installing Surge or Clash Verge Rev manually to proxy the network.
# Surge: https://dl.nssurge.com/mac/v5/Surge-latest.zip
# Clash Verge Rev: https://www.clashverge.dev/install.html#__tabbed_1_3

# Export
# `brew bundle dump`: Write all installed casks/formulae/images/taps into a Brewfile.

# Install Homebrew
# For general users
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# For users in Mainland China
## Option 1: 适合中国大陆用户使用的 Homebrew 应用代理镜像库 https://github.com/lzwme/homebrew-cn
# /bin/bash -c "$(curl -fsSL https://mirror.ghproxy.com/raw.githubusercontent.com/lzwme/homebrew-cn/HEAD/install.sh)"
## Option 2: Homebrew 中文网 https://brew.idayer.com
# /bin/bash -c "$(curl -fsSL https://gitee.com/ineo6/homebrew-install/raw/master/install.sh)"
## Option 3: Homebrew 国内源
# /bin/zsh -c "$(curl -fsSL https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh)"

# Install Homebrew Bundle
# 1. Copy Shell Export Command in Surge or Clash Verge Rev, paste into Terminal and hit Enter.
# 2. `brew bundle --file ~/Library/Mobile\ Documents/com~apple~CloudDocs/Install-macOS/Homebrew/Brewfile.rb`: Install and upgrade (by default) all dependencies from `Brewfile.rb`.
# `brew bundle --help`: Show help messages.

# Third-party repositories
tap "homebrew/bundle"
# tap "homebrew/services"
tap "jez/formulae"  # pandoc-sidenote
tap "remove-bg/tap"  # removebg
tap "wader/tap"  # fq
tap "krtirtho/apps" # spotube
tap "tombener/tap"
# tap "timescam/tap" # theboringnotch and trae
# tap "ttscoff/thelab" # gather-cli

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
brew "starship"

# Recommended libraries for `pyenv` https://github.com/pyenv/pyenv/wiki#suggested-build-environment
# Install Python 3.12.2 with `pyenv`: `env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install 3.12.2`
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
# `pandoc-crossref` depends on `pandoc`, so `pandoc` will be installed automatically
brew "pandoc-crossref"
brew "pandoc-sidenote"
brew "pandoc-plot"
brew "hugo"
brew "tree"
brew "mas"
brew "pyenv"
brew "r"
brew "node"
brew "pnpm"
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
brew "pdftk-java"
brew "autocorrect"
brew "fortune"
brew "zbar"
brew "rename"
brew "shellcheck"
brew "pwgen"
brew "translate-shell"
brew "onefetch"
brew "fastfetch"
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
brew "removebg"
brew "jq"
brew "yq"
brew "telnet"
brew "yarn"
brew "lux"
brew "wgcf"
brew "ffsend"
brew "lychee"
brew "gh"
brew "git-lfs"
brew "exiftool"
brew "djvu2pdf"
brew "fq"
brew "libpaper"
brew "cloudflared"
brew "vhs"
brew "pdfgrep"
brew "pdfrip"
brew "librsvg"
brew "trurl"
brew "pdf2svg"
brew "atuin"
brew "monolith"
brew "superfile"
brew "diff-pdf"
brew "git-filter-repo"
brew "typst"
brew "groff"
brew "bib-tool"
brew "opencc"
brew "gitleaks"
brew "macos-trash"
brew "pngpaste"
brew "bookget"
# brew "rmtrash"
# brew "switchaudio-osx"
# brew "clipboard"
# brew "latexindent"
# brew "transmission-cli"
# brew "go"
# brew "TheZoraiz/ascii-image-converter/ascii-image-converter"
# brew "gather-cli"
# brew "katana"
# brew "lua"
# brew "tldr"
# brew "pdfcpu"
# brew "fanyi"
# brew "flyctl"
# brew "mackup"
# brew "xdotool"
# brew "slides"
# brew "aria2"
# brew "gdal" # For installing R package `leaflet`

# Casks
# cask "setapp" # Comment if Setapp subscription is unavailable
cask "bettertouchtool"
cask "betterzip"
cask "downie"
cask "permute"
cask "one-switch"
cask "pdf-squeezer"
cask "textsoap"
cask "textsoap-agent"
# cask "folx"
# Install 4.1 manually: `brew install --cask https://raw.githubusercontent.com/Homebrew/homebrew-cask/9be98b75d567ffa19174c9ce18e1e1485cb7d20f/Casks/cleanshot.rb`
# cask "cleanshot"

cask "dropbox"
cask "adguard"
cask "alfred"
cask "raycast"
cask "iterm2"
cask "karabiner-elements"
cask "keyboard-maestro"
cask "logseq"
cask "obsidian"
cask "github"
cask "visual-studio-code"
cask "google-chrome"
cask "firefox"
# cask "applite"
cask "notion"
cask "lunar"
cask "pdf-expert"
cask "devonthink"
cask "historyhound"
cask "apparency"
cask "hazel"
cask "iina"
cask "cursor"
# cask "termius"
# cask "hookmark"
# cask "launchbar"
# cask "manila"
cask "pictogram"
cask "telegram"
cask "zotero"
cask "topnotch"
# cask "follow"
# cask "zight"
# cask "rstudio"
# cask "calibre"
# cask "brooklyn"
cask "skim"
# cask "bunch"
# cask "chromedriver"
# cask "mailbutler"
# cask "kindavim"
# cask "wooshy"
# cask "yattee"
cask "paper"
# cask "cider"
# cask "popmaker"
cask "popclip"
cask "lunarbar"
cask "ghostty"
# cask "cherry-studio"
# cask "pearcleaner"
cask "quarto-prerelease"
# 1. Install TinyTeX via Quarto
    # quarto install tinytex --update-path
# 2. Install LaTeX packages
    # tlmgr install pdfjam xurl enotez translations biblatex-sbl ctex biblatex-gb7714-2015 fvextra
# cask "quarto"
# Typst is installed accompined with Quarto, use the following command to add it to PATH:
# Apple Silicon Mac
    # sudo ln -s /Applications/quarto/bin/tools/aarch64/typst /opt/homebrew/bin/typst
# Intel Mac
    # sudo ln -s /Applications/quarto/bin/tools/x86_64/typst  /usr/local/bin/typst
# cask "bleunlock"
cask "spotube"
cask "searchlink"
cask "markdown-service-tools"
cask "netnewswire"
cask "1password"
cask "1password-cli"
# cask "pile"
# cask "heynote"
# cask "picgo"
cask "orbstack"
cask "inkscape"
cask "latest"
cask "jordanbaird-ice"
cask "theboringnotch"
# cask "gitbutler"
# cask "zed"
# cask "zoom"
# cask "tencent-meeting"
cask "adobe-acrobat-pro"
cask "clash-verge-rev"
# cask "coconutbattery"
cask "chatgpt"
cask "claude"
cask "markedit"
cask "ollama"
cask "pearcleaner"
# cask "squirrel"
# cask "bitwarden"
# cask "tickeys"
# cask "progressive-downloader"
# cask "vimr"
# cask "input-source-pro"
# cask "docker"
# cask "tor-browser"
# cask "microsoft-edge"
# cask "orion"
# cask "marked"
# cask "typora"
# cask "bike"
# cask "koodo-reader"
# cask "basictex"
# cask "mactex-no-gui"

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
cask "font-fontawesome"
cask "font-roboto"
cask "font-roboto-condensed"
cask "font-roboto-mono"
cask "font-roboto-serif"
cask "font-roboto-slab"
cask "font-noto-color-emoji"
cask "font-geist"
cask "font-geist-mono"
# cask "font-mona-sans"
# cask "font-hubot-sans"

# Fonts for Chinese
cask "font-noto-serif-cjk-sc"
cask "font-noto-sans-cjk-sc"
cask "font-lxgw-wenkai"
cask "font-lxgw-neoxihei"
cask "font-zhuque-fangsong"
cask "font-maple"
cask "font-chenyuluoyan"
cask "font-fandol"
cask "font-sarasa-gothic"
# cask "font-hanamina"

# Fonts for Japanese
cask "font-harano-aji"

# Apps from Mac App Store
# U.S. account
# mas "1Password for Safari", id: 1569813296
mas "Bob", id: 1630034110
mas "Drafts", id: 1435957248
mas "Craft", id: 1487937127
# mas "Zight", id: 417602904
# mas "MD Clock", id: 1536358464
# mas "PopClip", id: 445189367
# mas "scite", id: 1551820111
mas "Spark", id: 1176895641
mas "Noir", id: 1592917505
# mas "Pages", id: 409201541
# mas "Numbers", id: 409203825
# mas "Keynote", id: 409183694
mas "Microsoft Word", id: 462054704
mas "Microsoft Excel", id: 462058435
mas "Microsoft PowerPoint", id: 462062816
mas "SingleFile for Safari", id: 6444322545
mas "Wayback Machine", id: 1472432422
mas "Eudic", id: 434350458
mas "Vimkey", id: 1585682577
mas "Hush Nag Blocker", id: 1544743900
mas "Refined GitHub", id: 1519867270
mas "Obsidian Web Clipper", id: 6720708363
mas "Whisper Transcription", id: 1668083311
# mas "Infuse", id: 1136220934
# mas "OpenCat", id: 6445999201
# mas "PDFgear", id: 6469021132
# mas "Xcode", id: 497799835
# mas "Command X", id: 6448461551
# mas "OrbitRing Launcher", id: 6740730747
# mas "Velja", id: 1607635845
# mas "WhatFont", id: 1437138382
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
# mas "Windows App", id: 1295203466

# China account
mas "iA Writer", id: 775737590
mas "iPreview", id: 1519213509
mas "Pixelmator Pro", id: 1289583905
mas "Vinegar", id: 1591303229
mas "Dropover", id: 1355679052
# mas "Gifski", id: 1351639930
# mas "HazeOver", id: 430798174
# mas "i-Picker", id: 1556461417
# mas "Soulver", id: 1508732804
# mas "Magnet", id: 441258766
# mas "PasteNow", id: 1552536109
# mas "GIF Brewery 3", id: 1081413713
# mas "Affinity Publisher", id: 881418622
# mas "Wallpaper Wizard", id: 1266674560
