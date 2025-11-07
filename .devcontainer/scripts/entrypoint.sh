#!/bin/bash
# entrypoint.sh

# Example: adjust group membership dynamically (if needed)
HOST_DOCKER_GID=$(stat -c '%g' /var/run/docker.sock)
groupadd -for -g "$HOST_DOCKER_GID" docker
usermod -aG docker coder

# Optional: chown/chmod as needed for any files

# Exec as coder, replacing shell so group membership is correct
exec su -E - coder "$@"
# Or if gosu isn't available:
# exec su-exec coder "$@"
# Or as a fallback (if sudo installed and coder has no password):
# exec sudo -E -u coder "$@"
