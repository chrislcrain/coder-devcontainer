FROM mcr.microsoft.com/devcontainers/base:ubuntu

ENV DEBIAN_FRONTEND=noninteractive
ARG USER=coder
ARG UID=1001
ARG GID=1001
ARG DOCKER_GID=989

RUN groupadd -g ${DOCKER_GID} docker \
 && groupadd -g ${GID} ${USER} \
 && useradd -m -s /bin/zsh -u ${UID} -g ${GID} -G docker ${USER}

COPY .devcontainer/scripts /usr/local/share/devcontainer
COPY .devcontainer/files/environment /etc/environment
COPY .devcontainer/files/zshenv /etc/zsh/zshenv

RUN chmod +x /usr/local/share/devcontainer/*.sh \
 && chown -R ${USER}:${USER} /usr/local/share/devcontainer \
 && bash /usr/local/share/devcontainer/install_packages.sh \
 && bash /usr/local/share/devcontainer/install_awscli.sh \
 && bash /usr/local/share/devcontainer/install_dockercli.sh \
 && export PATH="/home/coder/.local/bin:$PATH" \
 && chsh -s /usr/bin/zsh ${USER}

USER coder
RUN bash /usr/local/share/devcontainer/configure_zsh.sh \
 && bash /usr/local/share/devcontainer/install_pyenv.sh \
 && bash /usr/local/share/devcontainer/install_poetry.sh \
 && bash /usr/local/share/devcontainer/install_pycharm.sh
COPY .devcontainer/files/.p10k.zsh /home/coder/.p10k.zsh
COPY .devcontainer/files/.gitconfig /home/coder/.gitconfig
COPY .devcontainer/files/.zshrc /home/coder/.zshrc
WORKDIR /code
