#!/bin/bash

# Update package lists and upgrade installed packages
sudo apt update && sudo apt upgrade -y

# Install necessary packages for Homebrew
sudo apt install -y build-essential procps curl file git

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Install formulae
brew bundle

# Authenticate GitHub CLI
gh auth login

# Install Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
