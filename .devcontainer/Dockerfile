FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ARG USER=coder
ARG UID=1001
ARG GID=1001

RUN groupadd -g ${GID} ${USER} \
 && useradd -m -s /bin/sh -u ${UID} -g ${GID} ${USER}

USER coder
WORKDIR /home/coder
