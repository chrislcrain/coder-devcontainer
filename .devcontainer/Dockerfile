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

USER ${USER}
WORKDIR /home/${USER}
