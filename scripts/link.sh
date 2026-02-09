#!/bin/bash

# Configuration for creating symlinks (relative path from dotfiles)
declare -a links=(
  ".config/lazygit"
  ".config/nvim"
  ".config/starship.toml"
  ".bashrc"
  ".gitconfig"
  ".tmux.conf"
)

SCRIPT_PATH=$(realpath "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")
DOTFILES_ROOT=$(dirname "$SCRIPT_DIR")

# Function to create a symlink
create_symlink() {
  local source_rel="$1"
  local source_abs="$DOTFILES_ROOT/$source_rel"
  local target_base="$HOME"
  local target_dir

  if [ "$(dirname "$source_rel")" = "." ]; then
    target_dir="$target_base"
  else
    target_dir="$target_base/$(dirname "$source_rel")"
  fi

  # Create the target directory if it does not exist
  if [ ! -d "$target_dir" ]; then
    mkdir -p "$target_dir"
  fi

  # Create the symlink
  if ln -sfv "$source_abs" "$target_dir"; then
    return 0
  else
    echo "[Error] Failed to create symlink: '$target_dir/$source_rel' -> '$source_abs'"
    return 1
  fi
}

errors=0

# Create symlinks
for source_rel in "${links[@]}"; do
  if ! create_symlink "$source_rel"; then
    ((errors++))
  fi
done

if [ "$errors" -ne 0 ]; then
  exit 1
fi
