FROM edgelevel/alpine-xfce-vnc:web

# TODO dog
# wget -qO - https://github.com/ogham/dog/releases/download/v0.1.0/dog-v0.1.0-x86_64-unknown-linux-gnu.zip | busybox unzip -

# add packages
RUN apk add --no-cache \
  openvpn \
  nmap \
  nmap-scripts

COPY bg-root.png /usr/share/backgrounds/xfce/xfce-custom.png
