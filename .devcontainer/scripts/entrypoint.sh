#!/usr/bin/env bash
set -e

DOCKER_GID=$(stat -c '%g' /var/run/docker.sock)
if ! getent group docker >/dev/null; then
  groupadd -g "$DOCKER_GID" docker
else
  groupmod -g "$DOCKER_GID" docker
fi
usermod -aG docker coder

exec su - coder
