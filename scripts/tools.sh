#!/bin/bash

# Configuration for downloading tools
declare -A tools=(
  ["win32yank"]="https://github.com/equalsraf/win32yank/releases/download/v0.1.1/win32yank-x64.zip;win32yank.exe"
  ["zenhan"]="https://github.com/iuchim/zenhan/releases/download/v0.0.1/zenhan.zip;zenhan/bin64/zenhan.exe"
)

target_bin_dir="$HOME/bin"
tmp_dir="$(uuidgen)"
errors=0

# Create ~/bin directory if it doesn't exist
mkdir -p "$target_bin_dir"

# Create a temporary directory
mkdir -p "$tmp_dir"

# Download and place tools
for tool_name in "${!tools[@]}"; do
  IFS=';' read -r download_url target_path <<<"${tools[$tool_name]}"
  download_zip=$(basename "$download_url")
  target_file=$(basename "$target_path")

  echo ""
  echo "==> Installing $tool_name"

  success=true

  # Download
  if curl -LO "$download_url"; then

    # Extract
    if unzip -d "$tmp_dir" "$download_zip"; then

      # Move and grant execute permission
      source_path="$tmp_dir/$target_path"
      destination_path="$target_bin_dir/$target_file"

      if mv "$source_path" "$destination_path"; then
        if chmod +x "$destination_path"; then
          :
        else
          echo "[Error] Failed to set execution permission: $destination_path"
          success=false
        fi
      else
        echo "[Error] Failed to move: $source_path -> $destination_path"
        success=false
      fi

      # Delete the downloaded zip file
      rm "$download_zip"
    else
      echo "[Error] Failed to extract: $download_zip"
      success=false
    fi
  else
    echo "[Error] Failed to download: $download_url"
    success=false
  fi

  if [ "$success" = false ]; then
    ((errors++))
  fi
done

# Delete the temporary directory
rm -rf "$tmp_dir"

if [ "$errors" -ne 0 ]; then
  exit 1
fi

exit 0
