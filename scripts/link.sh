#!/bin/bash

# シンボリックリンクを作成する設定 (リンク先 => dotfiles からの相対パス)
declare -A links=(
  ["$HOME/.gitconfig"]=".gitconfig"
  ["$HOME/.config/nvim"]="nvim"
)

# スクリプト自身の絶対パスを取得
SCRIPT_PATH=$(realpath "$0")

# スクリプトが存在するディレクトリの絶対パスを取得
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

# dotfiles ルートディレクトリをスクリプトの親ディレクトリと仮定
DOTFILES_ROOT=$(dirname "$SCRIPT_DIR")

# シンボリックリンクを作成する関数
create_symlink() {
  local link="$1"
  local relative_target="$2"
  local absolute_target="$DOTFILES_ROOT/$relative_target"

  # リンク先のディレクトリが存在しない場合は作成する
  local link_dir
  link_dir=$(dirname "$link")
  if [ ! -d "$link_dir" ]; then
    mkdir -p "$link_dir"
    echo "ディレクトリを作成しました: $link_dir"
  fi

  # シンボリックリンクが存在する場合は削除する
  if [ -L "$link" ]; then
    echo "既存のシンボリックリンクを削除します: $link"
    rm "$link"
  fi

  # シンボリックリンクを作成する
  if ln -s "$absolute_target" "$link"; then
    echo "シンボリックリンクを作成しました: $link -> $absolute_target"
  else
    echo "シンボリックリンクの作成に失敗しました: $link -> $absolute_target"
  fi
}

# 設定に基づいてシンボリックリンクを作成する
for link in "${!links[@]}"; do
  create_symlink "$link" "${links[$link]}"
done

echo "シンボリックリンクの作成が完了しました。"
