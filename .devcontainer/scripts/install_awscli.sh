#!/bin/bash
set -e
echo "Installing aws cli v2"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
rm -f awscliv2.zip
./aws/install
rm -rf aws
