FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ARG USER=coder
ARG UID=1001
ARG GID=1001

RUN groupadd -g ${GID} ${USER} \
 && useradd -m -s /bin/sh -u ${UID} -g ${GID} ${USER}

COPY .devcontainer/scripts /usr/local/share/devcontainer
RUN chmod +x /usr/local/share/devcontainer/*.sh \
 && chown -R ${USER}:${USER} /usr/local/share/devcontainer

RUN bash /usr/local/share/devcontainer/install_packages.sh
RUN bash /usr/local/share/devcontainer/install_awscli.sh

USER coder
RUN bash /usr/local/share/devcontainer/configure_zsh.sh
RUN pipx ensurepath

USER root
RUN chsh -s /usr/bin/zsh ${USER}

USER coder
WORKDIR /home/coder
