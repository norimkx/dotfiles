# カレントディレクトリの .txt ファイルを取得
$base64Files = Get-ChildItem -Filter "*.txt" -File

foreach ($txtFile in $base64Files) {
    try {
        # テキストの内容を読み込み（前後の空白や改行を削除）
        $base64Content = (Get-Content -Path $txtFile.FullName -Raw).Trim()

        # Base64文字列をバイト配列に変換
        $originalBytes = [System.Convert]::FromBase64String($base64Content)

        # 復元後のファイル名を決定（末尾の .txt を削除）
        # 例: xxx.exe.txt -> xxx.exe
        $originalFileName = $txtFile.Name -replace '\.txt$', ''

        # 同名のファイルが既に存在する場合は上書きしないようにチェック（任意）
        if (Test-Path $originalFileName) {
            Write-Warning "スキップ: $originalFileName は既に存在します。"
            continue
        }

        # バイナリとして書き出し
        [System.IO.File]::WriteAllBytes((Join-Path $pwd.Path $originalFileName), $originalBytes)

        Write-Host "復元完了: $($txtFile.Name) -> $originalFileName" -ForegroundColor Green
    } catch {
        Write-Error "エラー: $($txtFile.Name) の復元に失敗しました。Base64形式ではない可能性があります。"
    }
}
