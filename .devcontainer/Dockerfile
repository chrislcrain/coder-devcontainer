FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ARG USER=coder
ARG UID=1001
ARG GID=1001
ARG DOCKER_GID=989

RUN groupadd -g ${DOCKER_GID} docker \
 && groupadd -g ${GID} ${USER} \
 && useradd -m -s /bin/zsh -u ${UID} -g ${GID} -G docker ${USER}

COPY .devcontainer/files/.p10k.zsh /home/coder/.p10k.zsh
COPY .devcontainer/files/.gitconfig /home/coder/.gitconfig
COPY .devcontainer/scripts /usr/local/share/devcontainer

RUN chown coder:coder /home/coder/.p10k.zsh \
 && chmod 0644 /home/coder/.p10k.zsh \
 && chown coder:coder /home/coder/.gitconfig \
 && chmod 0644 /home/coder/.gitconfig \
 && chmod +x /usr/local/share/devcontainer/*.sh \
 && chown -R ${USER}:${USER} /usr/local/share/devcontainer \
 && bash /usr/local/share/devcontainer/install_packages.sh \
 && bash /usr/local/share/devcontainer/install_awscli.sh \
 && bash /usr/local/share/devcontainer/install_dockercli.sh \
 && mkdir -p /home/coder/.local/bin \
 && ln -df /home/coder/.local/bin/poetry /usr/bin/poetry \
 && chsh -s /usr/bin/zsh ${USER}

USER coder
RUN bash /usr/local/share/devcontainer/configure_zsh.sh \
 && bash /usr/local/share/devcontainer/install_pyenv.sh \
 && bash /usr/local/share/devcontainer/install_poetry.sh
WORKDIR /workspace
