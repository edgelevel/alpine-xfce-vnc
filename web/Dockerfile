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

# setup gcc
RUN apk add --no-cache \
  gcc make

# setup sdkman
RUN curl -s "https://get.sdkman.io" | bash && \
  source $HOME/.sdkman/bin/sdkman-init.sh && \
  sdk version && \
  rm -rf $HOME/.sdkman/tmp/*

# update configs
COPY .bashrc .vimrc /root/
# change background
COPY bg-kernel.png /usr/share/backgrounds/xfce/xfce-custom.png

WORKDIR /root
