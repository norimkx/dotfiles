# カレントディレクトリの全ファイルを取得（フォルダは除外）
$files = Get-ChildItem -File

foreach ($file in $files) {
    # ファイルをバイト配列として読み込み
    $fileBytes = [System.IO.File]::ReadAllBytes($file.FullName)

    # Base64文字列に変換
    $base64String = [System.Convert]::ToBase64String($fileBytes)

    # 出力ファイル名の設定（例: xxx.exe -> xxx.exe.txt）
    $outputFileName = "$($file.Name).txt"

    # テキストファイルとして書き出し（UTF8指定）
    $base64String | Out-File -FilePath $outputFileName -Encoding utf8

    Write-Host "処理完了: $($file.Name) -> $outputFileName"
}
