#!/bin/bash

# Configuration for creating symbolic links (relative path from dotfiles)
declare -a links=(
  ".bashrc"
  ".config/lazygit"
  ".config/nvim"
  ".config/starship.toml"
  ".gitconfig"
  ".tmux.conf"
)

SCRIPT_PATH=$(realpath "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")
DOTFILES_ROOT=$(dirname "$SCRIPT_DIR")

# Function to create or update a symbolic link
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
    echo "Created directory: $target_dir"
  fi

  # Create or update the symbolic link
  if ln -sfv "$source_abs" "$target_dir"; then
    :
  else
    echo "Failed to create or update symbolic link: '$target_dir/$source_rel' -> '$source_abs'"
  fi
}

# Create symbolic links based on the configuration
for source_rel in "${links[@]}"; do
  create_symlink "$source_rel"
done

echo "Symbolic link creation completed"
