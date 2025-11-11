#!/usr/bin/env bash

wget https://download.jetbrains.com/idea/code-with-me/backend/jetbrains-clients-downloader-linux-x86_64-1867.tar.gz && \
tar -xzvf jetbrains-clients-downloader-linux-x86_64-1867.tar.gz
rm jetbrains-clients-downloader-linux-x86_64-1867.tar.gz

./jetbrains-clients-downloader-linux-x86_64-1867/bin/jetbrains-clients-downloader --products-filter PY --build-filter 252.26199.168 --platforms-filter linux-x64 --download-backends ~/JetBrains
tar -xzvf ~/JetBrains/backends/PY/*.tar.gz -C ~/JetBrains/backends/PY
rm -rf ~/JetBrains/backends/PY/*.tar.gz
