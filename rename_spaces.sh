#!/bin/bash

# カレントディレクトリから再帰的にファイルを検索し、スペースを含むファイル名を処理
find . -type f -name "* *" -print0 | while IFS= read -r -d '' file; do
    # ファイル名からディレクトリ部分を取り除き、単純なファイル名に
    filename=$(basename -- "$file")
    # ディレクトリパスを取得
    directory=$(dirname -- "$file")
    # スペースをアンダーバーに置換
    newfilename=${filename// /_}
    # ファイルをリネーム
    mv -- "$file" "$directory/$newfilename"
done

echo "All spaces in file names have been replaced with underscores."
