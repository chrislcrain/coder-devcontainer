# Ubuntu base, good for devcontainers + apt
FROM ubuntu:24.04

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive
ARG USER=coder
ARG UID=1001
ARG GID=1001

# Create non-root dev user
RUN groupadd -g ${GID} ${USER} \
 && useradd -m -s /bin/zsh -u ${UID} -g ${GID} ${USER}

# Core tools + Python dev essentials
# RUN apt-get update && apt-get install -y --no-install-recommends \
#     zsh git curl ca-certificates \
#     build-essential pkg-config \
#     python3 python3-venv python3-pip python-is-python3 pipx \
#     libpq-dev \
#  && rm -rf /var/lib/apt/lists/*

# # (Optional) let pipx shims be on PATH for all shells
# ENV PIPX_BIN_DIR=/home/${USER}/.local/bin
# ENV PATH="${PIPX_BIN_DIR}:${PATH}"

# # Include your helper scripts (postCreate, zsh setup, etc.)
# COPY .devcontainer/scripts /usr/local/share/devcontainer
# RUN chown -R ${USER}:${USER} /usr/local/share/devcontainer \
#  && chmod +x /usr/local/share/devcontainer/*.sh || true

USER ${USER}
WORKDIR /home/${USER}
