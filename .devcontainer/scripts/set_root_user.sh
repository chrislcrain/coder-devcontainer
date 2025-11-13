#!/usr/bin/env bash

usermod -aG sudo coder
echo 'coder ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/coder
chmod 0440 /etc/sudoers.d/coder
echo "User set as root."
