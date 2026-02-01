#!/bin/bash

# Update package lists and upgrade installed packages
sudo apt update && sudo apt upgrade -y

# Install necessary packages for Homebrew
sudo apt install -y build-essential procps curl file git

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Install formulae
brew install ast-grep
brew install connect
brew install fd
brew install fzf
brew install gh
brew install jq
brew install lazygit
brew install luarocks
brew install neovim
brew install nkf
brew install nvm
brew install openjdk
brew install ripgrep
brew install starship
brew install stylua
brew install tmux
brew install tree
brew install unzip
brew install wget
brew install zip

# Authenticate GitHub CLI
gh auth login

# Install Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
