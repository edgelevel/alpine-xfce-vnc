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

# setup common
RUN apk add --no-cache \
  git \
  vim \
  zip

# setup filesystem
RUN apk add --no-cache \
  file \
  exa \
  fd \
  ripgrep

# setup network
RUN apk add --no-cache \
  bind-tools \
  curl \
  httpie \
  jq

# setup monitor
RUN apk add --no-cache \
  ncdu \
  htop

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

# setup browser
RUN apk add --no-cache \
  firefox-esr \
  lynx

# setup terminal
RUN apk add --no-cache \
  xfce4-terminal \
  tmux \
  neofetch

# setup image viewer
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
  nomacs

# update configs
COPY .bashrc .vimrc /root/

WORKDIR /root
