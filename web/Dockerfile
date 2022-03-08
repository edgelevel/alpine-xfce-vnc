FROM edgelevel/alpine-xfce-vnc:base

# timezone
# https://gitlab.alpinelinux.org/alpine/aports/-/issues/5543
# /usr/share/zoneinfo/Europe/Dublin
ARG TZ='Europe/Dublin'
ENV DEFAULT_TZ ${TZ}
RUN apk upgrade --update && \
  apk add --no-cache tzdata && \
  cp /usr/share/zoneinfo/${DEFAULT_TZ} /etc/localtime && \
  date

# commons
RUN apk add --no-cache \
  git \
  vim \
  zip

# python and pip
# http://github.com/Docker-Hub-frolvlad/docker-alpine-python3
ENV PYTHONUNBUFFERED=1
RUN apk add --no-cache \
  python3 && \
  ln -sf python3 /usr/bin/python && \
  python3 -m ensurepip && \
  rm -r /usr/lib/python*/ensurepip && \
  pip3 install --no-cache --upgrade pip setuptools wheel && \
  ln -sf pip3 /usr/bin/pip

# gcc
RUN apk add --no-cache \
  musl-dev \
  gcc \
  make

# networking
RUN apk add --no-cache \
  bind-tools \
  curl \
  httpie \
  jq

# java
RUN apk add --no-cache \
  openjdk11-jdk

# golang
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
  go

# rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# filesystem
RUN apk add --no-cache \
  exa \
  fd \
  ripgrep

# monitoring
RUN apk add --no-cache \
  ncdu \
  htop

# browsers
RUN apk add --no-cache \
  firefox-esr \
  lynx

# terminals
RUN apk add --no-cache \
  xfce4-terminal \
  tmux \
  neofetch

# image viewer
# TODO nomacs | viu | imv

# update configs
COPY .bashrc .vimrc /root/

WORKDIR /root
