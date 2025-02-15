# Homebrew Formulae and Casks

[![Auto Update](https://github.com/tombener/homebrew-tap/actions/workflows/auto-update.yml/badge.svg)](https://github.com/tombener/homebrew-tap/actions/workflows/auto-update.yml)

Install [Homebrew](https://brew.sh):

```shell
# For general users
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# For users in Mainland China
## Option 1
/bin/bash -c "$(curl -fsSL https://mirror.ghproxy.com/raw.githubusercontent.com/lzwme/homebrew-cn/HEAD/install.sh)"
## Option 2
/bin/bash -c "$(curl -fsSL https://gitee.com/ineo6/homebrew-install/raw/master/install.sh)"
## Option 3
/bin/zsh -c "$(curl -fsSL https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh)"
```

Install via [Brewfile.rb](Brewfile.rb) in the current directory. Make sure you have read the file and understand what it does before running it:

```shell
brew bundle --file Brewfile.rb
```

Tap this repository to install individual formulae and casks:

```shell
brew tap tombener/tap

brew install <formula>
brew install --cask <cask>
```
