#!/usr/bin/env bash

TPM_DIR="$HOME/.tmux/plugins/tpm"

# Install Tmux Plugin Manager
if [ -d "$TPM_DIR" ]; then
  echo "==> tpm is already installed: $TPM_DIR"
else
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi
