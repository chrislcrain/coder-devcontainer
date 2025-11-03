FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

# Create a "coder" user compatible with devcontainers (uid/gid 1000 by default)
ARG USER=coder
ARG UID=1000
ARG GID=1000
RUN groupadd -g ${GID} ${USER} \
 && useradd -m -s /bin/zsh -u ${UID} -g ${GID} ${USER}

# Install OS packages (moved from cloud-init)
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    zsh gh curl ca-certificates gnupg lsb-release \
    git build-essential unzip jq htop net-tools iputils-ping dnsutils tree wget tmux make \
    libssl-dev zlib1g-dev python3-dev libpq-dev libbz2-dev libreadline-dev libsqlite3-dev \
    xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev \
  && rm -rf /var/lib/apt/lists/*

RUN ARCH=$(uname -m) \
 && curl -fsSL "https://awscli.amazonaws.com/awscli-exe-linux-${ARCH}.zip" -o /tmp/awscliv2.zip \
 && unzip -q /tmp/awscliv2.zip -d /tmp \
 && /tmp/aws/install \
 && rm -rf /tmp/aws /tmp/awscliv2.zip

# Drop your helper scripts into the image
COPY .devcontainer/scripts /usr/local/share/devcontainer
RUN chmod +x /usr/local/share/devcontainer/*.sh \
 && chown -R ${USER}:${USER} /usr/local/share/devcontainer

USER ${USER}
WORKDIR /home/${USER}
