#!/bin/bash

# パッケージリストの更新、インストール済みパッケージのアップデート
sudo apt update && sudo apt upgrade -y

# Homebrew に必要なパッケージのインストール
sudo apt install -y build-essential procps curl file git

# Homebrew のインストール
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# 各種インストール
brew install ast-grep
brew install connect
brew install fd
brew install fish
brew install fzf
brew install gh
brew install imagemagick
brew install jq
brew install lazygit
brew install luarocks
brew install neovim
brew install nvm
brew install ripgrep
brew install starship
brew install stylua
brew install tmux
brew install tree
brew install unzip
brew install wget
brew install zip

# GitHub CLI の認証設定
gh auth login
