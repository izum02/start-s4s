#!/bin/bash
set -e

# ホームディレクトリ内に作業ディレクトリを作成
APP_DIR="$HOME/app"
mkdir -p "$APP_DIR"
cd "$APP_DIR" || exit 1

# Hugging Face のリポジトリをクローン
git clone https://huggingface.co/spaces/soiz1/soiz1-s4s-editor .

# translations ディレクトリを作成し、権限を設定
mkdir -p "$APP_DIR/translations"
chmod -R 777 "$APP_DIR/translations"
chmod -R 777 "$APP_DIR"

# 依存関係をインストール
npm install --prefer-offline --no-audit --legacy-peer-deps

# scratch-vm を追加インストール
npm install scratch-vm@git+https://huggingface.co/datasets/soiz1/s4s-vm

# サーバーを起動
npm start
