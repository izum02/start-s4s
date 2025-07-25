#!/bin/bash

# エラーが発生したらスクリプトを終了
set -e

# 作業ディレクトリを作成
mkdir -p /app
cd /app || exit 1

# Hugging Face のリポジトリをクローン
# 公開スペースなので、Git LFS に依存していない場合はそのまま clone 可能
git clone https://huggingface.co/spaces/soiz1/soiz1-s4s-editor .

# translations ディレクトリを作成し、権限を設定
mkdir -p /app/translations
chmod -R 777 /app/translations
chmod -R 777 /app

# 依存関係をインストール（互換性オプション付き）
npm install --prefer-offline --no-audit --legacy-peer-deps

# scratch-vm を追加インストール（Git URL）
npm install scratch-vm@git+https://huggingface.co/datasets/soiz1/s4s-vm

# サーバーを起動
npm start
