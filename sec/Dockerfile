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
  socat \
  openssh \
  openvpn \
  nmap \
  nmap-scripts \
  proxychains-ng \
  exiftool \
  john

# TODO add and fix "searchsploit -u"
# setup searchsploit (requires tput)
RUN apk add --no-cache \
  ncurses && \
  git clone https://github.com/offensive-security/exploitdb.git /opt/exploitdb && \
  ln -sf /opt/exploitdb/searchsploit /usr/local/bin/searchsploit

# setup fuzzers and wordlists
RUN mkdir -p /usr/share/wordlists && \
  curl -s -k -L http://mng.bz/DzMn -o /usr/share/wordlists/rockyou.txt && \
  git clone https://github.com/danielmiessler/SecLists.git /usr/share/seclists && \
  go get -u github.com/OJ/gobuster && \
  go get -u github.com/ffuf/ffuf

# setup burp suite
# forward internal port 8080 and listen on 8081
RUN mkdir -pv /opt/burp/ && \
  wget -q -O /opt/burp/burpsuite_community_v${BURP_VERSION}.jar \
  https://portswigger.net/burp/releases/download?product=community\&version=${BURP_VERSION}\&type=jar && \
  ln -sf /opt/burp/burpsuite_community_v${BURP_VERSION}.jar /opt/burp/burpsuite.jar && \
  echo -e "echo 'Burp Suite LISTEN on port 8081 ...'\nsocat tcp-l:8081,fork,reuseaddr tcp:127.0.0.1:8080 &\njava -jar /opt/burp/burpsuite.jar" > /usr/local/bin/burpsuite && \
  chmod u+x /usr/local/bin/burpsuite

# setup privesc
RUN git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git \
  /opt/privilege-escalation-awesome-scripts-suite && \
  git clone https://github.com/rebootuser/LinEnum.git \
  /opt/LinEnum

COPY bg-root.png /usr/share/backgrounds/xfce/xfce-stripes.png
