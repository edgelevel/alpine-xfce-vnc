FROM edgelevel/alpine-xfce-vnc:base

# setup timezone
# https://gitlab.alpinelinux.org/alpine/aports/-/issues/5543
# /usr/share/zoneinfo/Europe/Dublin
ARG TZ='Europe/Dublin'
ENV DEFAULT_TZ ${TZ}
RUN apk upgrade --update && \
  apk add --no-cache tzdata && \
  cp /usr/share/zoneinfo/${DEFAULT_TZ} /etc/localtime && \
  date

# add gui
RUN apk add --no-cache \
  firefox-esr \
  xfce4-terminal

# setup image viewer
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
  nomacs

# add packages
RUN apk add --no-cache \
  file \
  exa \
  fd \
  ripgrep \
  git \
  vim \
  zip \
  curl \
  httpie \
  jq \
  ncdu \
  htop \
  neofetch

# setup python and pip
# http://github.com/Docker-Hub-frolvlad/docker-alpine-python3
ENV PYTHONUNBUFFERED=1
RUN apk add --no-cache \
  python3 && \
  ln -sf python3 /usr/bin/python && \
  python3 -m ensurepip && \
  rm -r /usr/lib/python*/ensurepip && \
  pip3 install --no-cache --upgrade pip setuptools wheel && \
  ln -sf pip3 /usr/bin/pip

# setup gcc, go, java
RUN apk add --no-cache \
  musl-dev \
  gcc \
  make \
  go \
  openjdk11-jdk

# update configs
COPY .bashrc .vimrc /root/

# TODO fixme
# change background
COPY bg-kernel.png /usr/share/backgrounds/xfce/xfce-stripes.png

WORKDIR /root
