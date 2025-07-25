#!/bin/bash

# 1. リポジトリをクローン
git clone https://huggingface.co/spaces/soiz1/soiz1-s4s-editor
cd soiz1-s4s-editor || { echo "Clone failed"; exit 1; }

# 2. Dockerfile が存在するか確認
if [ ! -f Dockerfile ]; then
  echo "Dockerfile が見つかりません。"
  exit 1
fi

# 3. Docker イメージをビルド
docker build -t soiz1-s4s-editor .

# 4. コンテナを起動（例: ポート 7860）
docker run -d -p 7860:7860 --name s4s-editor soiz1-s4s-editor

echo "http://localhost:7860 にアクセスしてください。"
