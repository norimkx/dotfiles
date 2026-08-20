#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "$(realpath "$0")")

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Install formulae listed in Brewfile
brew bundle --file="$SCRIPT_DIR/Brewfile"
