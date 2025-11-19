#!/usr/bin/env bash

TARGET_DIR="/home/coder"

curl -fL \
  -o "$TARGET_DIR/jetbrains-clients-downloader-linux-x86_64-1867.tar.gz" \
  "https://download.jetbrains.com/idea/code-with-me/backend/jetbrains-clients-downloader-linux-x86_64-1867.tar.gz"

tar -xzvf "$TARGET_DIR/jetbrains-clients-downloader-linux-x86_64-1867.tar.gz" -C "$TARGET_DIR"
rm "$TARGET_DIR/jetbrains-clients-downloader-linux-x86_64-1867.tar.gz"

mkdir -p "$TARGET_DIR/JetBrains/backends/PY"

curl -fL \
  -o "$TARGET_DIR/JetBrains/backends/PY/pycharm-2025.2.4.tar.gz" \
  "https://download.jetbrains.com/python/pycharm-2025.2.4.tar.gz"

"$TARGET_DIR/jetbrains-clients-downloader-linux-x86_64-1867/bin/jetbrains-clients-downloader" \
  --products-filter PY \
  --build-filter 252.27397.106 \
  --platforms-filter linux-x64 \

tar -xzvf "$TARGET_DIR"/JetBrains/backends/PY/*.tar.gz -C "$TARGET_DIR/JetBrains/backends/PY"
rm -rf "$TARGET_DIR"/JetBrains/backends/PY/*.tar.gz
