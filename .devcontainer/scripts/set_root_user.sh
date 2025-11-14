#!/usr/bin/env bash

if [ "${USER_IS_ROOT}" = "true" ]; then
  usermod -aG sudo coder
  echo 'coder ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/coder
  chmod 440 /etc/sudoers.d/coder
  echo "User set as root."
else
  echo "User is not set as root: skipping sudoer setup."
fi
