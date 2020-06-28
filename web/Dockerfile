FROM edgelevel/alpine-xfce-vnc:base

# add packages
RUN apk add --no-cache \
  curl \
  httpie \
  jq \
  vim \
  exa \
  git \
  lynx \
  firefox-esr \
  xfce4-terminal

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
  nomacs

COPY .bashrc /root
WORKDIR /root
