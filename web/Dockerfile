FROM edgelevel/alpine-xfce-vnc:base

RUN apk add --no-cache \
  firefox-esr \
  xfce4-terminal

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
  nomacs

# add packages
RUN apk add --no-cache \
  exa \
  git \
  vim \
  zip \
  curl \
  httpie \
  jq \
  lynx \
  tmux

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

COPY .bashrc /root
COPY .vimrc /root
COPY bg-* /usr/share/backgrounds/linux/

WORKDIR /root
