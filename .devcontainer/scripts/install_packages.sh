#!/usr/bin/env bash

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
    vim \
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
 && update-ca-certificates \
 && rm -rf /var/lib/apt/lists/*
