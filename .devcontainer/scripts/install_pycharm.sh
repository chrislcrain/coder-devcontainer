#!/usr/bin/env bash

TARGET_DIR="/home/coder"

wget -O "$TARGET_DIR/jetbrains-clients-downloader-linux-x86_64-1867.tar.gz" \
  https://download.jetbrains.com/idea/code-with-me/backend/jetbrains-clients-downloader-linux-x86_64-1867.tar.gz

tar -xzvf "$TARGET_DIR/jetbrains-clients-downloader-linux-x86_64-1867.tar.gz" -C "$TARGET_DIR"
rm "$TARGET_DIR/jetbrains-clients-downloader-linux-x86_64-1867.tar.gz"

"$TARGET_DIR/jetbrains-clients-downloader-linux-x86_64-1867/bin/jetbrains-clients-downloader" \
  --products-filter PY \
  --build-filter 252.26199.168 \
  --platforms-filter linux-x64 \
  --download-backends "$TARGET_DIR/JetBrains"

tar -xzvf "$TARGET_DIR"/JetBrains/backends/PY/*.tar.gz -C "$TARGET_DIR/JetBrains/backends/PY"
rm -rf "$TARGET_DIR"/JetBrains/backends/PY/*.tar.gz
