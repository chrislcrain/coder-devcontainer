#!/usr/bin/env bash

if [ "${USER_IS_ROOT}" = "true" ]; then
  usermod -aG sudo coder
  echo 'coder ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
  echo "User set as root."
else
  echo "User is not set as root: skipping sudoer setup."
fi
