#!/bin/bash

# Downloads tools and places executables in ~/bin

# Configuration
declare -A tools=(
  ["win32yank"]="https://github.com/equalsraf/win32yank/releases/download/v0.1.1/win32yank-x64.zip;win32yank.exe"
  ["zenhan"]="https://github.com/iuchim/zenhan/releases/download/v0.0.1/zenhan.zip;zenhan/bin64/zenhan.exe"
)
target_bin_dir="$HOME/bin"
tmp_dir="tmp_download"

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
  echo "=== Starting processing for $tool_name ==="

  # Download
  echo "Downloading from $download_url..."
  if curl -LO "$download_url"; then
    echo "Downloaded $download_zip"

    # Extract
    echo "Extracting $download_zip to $tmp_dir..."
    if unzip -d "$tmp_dir" "$download_zip"; then
      echo "Extracted $download_zip"

      # Move and grant execute permission
      source_path="$tmp_dir/$target_path"
      destination_path="$target_bin_dir/$target_file"

      echo "Moving $source_path to $destination_path..."
      if mv "$source_path" "$destination_path"; then
        echo "Moved to $destination_path"
        echo "Granting execute permission to $destination_path..."
        if chmod +x "$destination_path"; then
          echo "Granted execute permission to $destination_path"
        else
          echo "Error: Failed to grant execute permission to $destination_path"
        fi
      else
        echo "Error: Failed to move $source_path to $destination_path"
      fi

      # Delete the downloaded zip file
      rm "$download_zip"
    else
      echo "Error: Failed to extract $download_zip"
    fi
  else
    echo "Error: Failed to download from $download_url"
  fi
done

# Delete the temporary directory
echo ""
echo "Deleting temporary directory ($tmp_dir)..."
rm -rf "$tmp_dir"
echo "Deleted temporary directory"

echo "Script completed"

exit 0
