FROM edgelevel/alpine-xfce-vnc:web

# TODO install rustc in web and replace bind-tools (dig) with dog (nslookup is already included in busybox)
# wget -qO - https://github.com/ogham/dog/releases/download/v0.1.0/dog-v0.1.0-x86_64-unknown-linux-gnu.zip | busybox unzip -

# TODO split by categories
# add packages
RUN apk add --no-cache \
  lynx \
  tmux \
  bind-tools \
  openssh \
  openvpn \
  nmap \
  nmap-scripts

# setup searchsploit (requires tput)
RUN apk add --no-cache \
  ncurses && \
  git clone https://github.com/offensive-security/exploitdb.git /opt/exploitdb && \
  ln -sf /opt/exploitdb/searchsploit /usr/local/bin/searchsploit

COPY bg-root.png /usr/share/backgrounds/xfce/xfce-stripes.png
