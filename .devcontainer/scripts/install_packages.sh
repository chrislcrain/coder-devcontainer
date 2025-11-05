#!/usr/bin/env bash

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" \
| tee /etc/apt/sources.list.d/docker.list >/dev/null

apt-get update && apt-get install -y \
    pipx \
    gh \
    curl \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release \
    nfs-common \
    git \
    build-essential \
    software-properties-common \
    unzip \
    jq \
    htop \
    net-tools \
    iputils-ping \
    dnsutils \
    tree \
    wget \
    tmux \
    zsh \
    make \
    libssl-dev \
    zlib1g-dev \
    python3-dev \
    libpq-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    xz-utils \
    tk-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libffi-dev \
    liblzma-dev \
    docker-ce-cli \
 && rm -rf /var/lib/apt/lists/*
