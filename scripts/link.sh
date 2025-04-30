#!/bin/bash

# シンボリックリンクを作成する設定 (dotfiles からの相対パス = リンクを作成するディレクトリ)
declare -A links=(
  ["nvim"]="$HOME/.config"
  [".bashrc"]="$HOME"
  [".gitconfig"]="$HOME"
)

# スクリプト自身の絶対パスを取得
SCRIPT_PATH=$(realpath "$0")

# スクリプトが存在するディレクトリの絶対パスを取得
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

# dotfiles ディレクトリの絶対パスを取得
DOTFILES_ROOT=$(dirname "$SCRIPT_DIR")

# シンボリックリンクを作成する関数
create_symlink() {
  local source_rel="$1"
  local source_abs="$DOTFILES_ROOT/$source_rel"
  local target_dir="$2"

  # 作成するリンクのディレクトリが存在しない場合は作成する
  if [ ! -d "$target_dir" ]; then
    mkdir -p "$target_dir"
    echo "ディレクトリを作成しました: $target_dir"
  fi

  # シンボリックリンクを作成または更新する
  if ln -sfv "$source_abs" "$target_dir"; then
    :
  else
    echo "シンボリックリンクの作成または更新に失敗しました: '$target_dir/$source_rel' -> '$source_abs'"
  fi
}

# 設定に基づいてシンボリックリンクを作成する
for source in "${!links[@]}"; do
  create_symlink "$source" "${links[$source]}"
done

echo "シンボリックリンクの作成が完了しました"
