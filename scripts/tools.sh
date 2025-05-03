#!/bin/bash

# スクリプトの目的: 複数のツールをダウンロードし、実行可能ファイルとして ~/bin に配置する

# 設定
declare -A tools=(
  ["win32yank"]="https://github.com/equalsraf/win32yank/releases/download/v0.1.1/win32yank-x64.zip;win32yank.exe"
  ["zenhan"]="https://github.com/iuchim/zenhan/releases/download/v0.0.1/zenhan.zip;zenhan/bin64/zenhan.exe"
)
target_bin_dir="$HOME/bin"
tmp_dir="tmp_download"

# ~/bin ディレクトリが存在しない場合は作成
mkdir -p "$target_bin_dir"

# 一時ディレクトリを作成
mkdir -p "$tmp_dir"

# ツールのダウンロードと配置
for tool_name in "${!tools[@]}"; do
  IFS=';' read -r download_url target_path <<<"${tools[$tool_name]}"
  download_zip=$(basename "$download_url")
  target_file=$(basename "$target_path")

  echo ""
  echo "=== $tool_name の処理を開始します ==="

  # ダウンロード
  echo "$download_url からダウンロード中..."
  if curl -LO "$download_url"; then
    echo "$download_zip のダウンロードが完了しました"

    # 展開
    echo "$download_zip を $tmp_dir に展開中..."
    if unzip -d "$tmp_dir" "$download_zip"; then
      echo "$download_zip の展開が完了しました"

      # 移動と実行権限付与
      source_path="$tmp_dir/$target_path"
      destination_path="$target_bin_dir/$target_file"

      echo "$source_path を $destination_path に移動中..."
      if mv "$source_path" "$destination_path"; then
        echo "$destination_path に移動しました"
        echo "$destination_path に実行権限を付与中..."
        if chmod +x "$destination_path"; then
          echo "$destination_path に実行権限を付与しました"
        else
          echo "エラー: $destination_path への実行権限の付与に失敗しました"
        fi
      else
        echo "エラー: $source_path の $destination_path への移動に失敗しました"
      fi

      # ダウンロードした zip ファイルを削除
      rm "$download_zip"
    else
      echo "エラー: $download_zip の展開に失敗しました"
    fi
  else
    echo "エラー: $download_url からのダウンロードに失敗しました"
  fi
done

# 一時ディレクトリを削除
echo ""
echo "一時ディレクトリ ($tmp_dir) を削除中..."
rm -rf "$tmp_dir"
echo "一時ディレクトリを削除しました"

echo "スクリプトが完了しました"

exit 0
