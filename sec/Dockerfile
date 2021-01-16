FROM edgelevel/alpine-xfce-vnc:web

ARG BURP_VERSION=2020.12.1

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
  nmap-scripts \
  proxychains-ng

# TODO add and fix "searchsploit -u"
# setup searchsploit (requires tput)
RUN apk add --no-cache \
  ncurses && \
  git clone https://github.com/offensive-security/exploitdb.git /opt/exploitdb && \
  ln -sf /opt/exploitdb/searchsploit /usr/local/bin/searchsploit

# setup burp suite
RUN mkdir -pv /opt/burp/ && \
  wget -q -O /opt/burp/burpsuite_community_v${BURP_VERSION}.jar \
  https://portswigger.net/burp/releases/download?product=community\&version=${BURP_VERSION}\&type=jar && \
  ln -sf /opt/burp/burpsuite_community_v${BURP_VERSION}.jar /opt/burp/burpsuite.jar && \
  echo "java -jar /opt/burp/burpsuite.jar" > /usr/local/bin/burpsuite && \
  chmod u+x /usr/local/bin/burpsuite

COPY bg-root.png /usr/share/backgrounds/xfce/xfce-stripes.png
