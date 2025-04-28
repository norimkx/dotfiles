#!/bin/bash

# 念のため、スクリプトの実行を中断する条件を設定 (エラー発生時や未設定変数参照時)
set -euo pipefail

# パッケージリストの更新、インストール済みパッケージのアップデート
sudo apt update && sudo apt upgrade -y

# Homebrew に必要なパッケージのインストール
sudo apt install -y build-essential procps curl file git

# Homebrew のインストール
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo >>"$HOME/.bashrc"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >>"$HOME/.bashrc"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# 各種インストール
brew install wget curl
brew install zip unzip
brew install gcc
brew install fzf
brew install fd
brew install ripgrep
brew install ast-grep
brew install lazygit
brew install neovim
brew install fish
brew install stylua
brew install luarocks

# nvm のインストール
brew install nvm

NVM_CONFIG='
export NVM_DIR="$HOME/.nvm"
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm"'
echo "$NVM_CONFIG" >>"$HOME/.bashrc"
