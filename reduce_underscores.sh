#!/bin/bash

# カレントディレクトリから再帰的にファイルを検索し、アンダーバーが重複しているファイル名を処理
find . -type f -name "*_*" -print0 | while IFS= read -r -d '' file; do
    # ファイル名からディレクトリ部分を取り除き、単純なファイル名に
    filename=$(basename -- "$file")
    # ディレクトリパスを取得
    directory=$(dirname -- "$file")
    # 重複するアンダーバーを一つに置換
    newfilename=$(echo $filename | tr -s '_')
    # 新しいファイル名が元のファイル名と異なる場合のみリネームを実行
    if [ "$filename" != "$newfilename" ]; then
        mv -- "$file" "$directory/$newfilename"
    fi
done

echo "All consecutive underscores in file names have been replaced with a single underscore."
