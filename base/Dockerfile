FROM alpine:3.15

ENV DISPLAY :1
# alternative 1024x768x16
ENV RESOLUTION 1920x1080x24

# setup desktop environment (xfce4), display server (xvfb), vnc server (x11vnc)
RUN apk add --no-cache \
  xfce4 \
  faenza-icon-theme \
  xvfb \
  x11vnc

# setup novnc
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
  novnc && \
  ln -s /usr/share/novnc/vnc.html /usr/share/novnc/index.html

# required for command expansion
RUN apk add --no-cache bash
SHELL ["/bin/bash", "-c"]

# setup supervisor
COPY supervisor /tmp
RUN apk add --no-cache supervisor && \
  echo_supervisord_conf > /etc/supervisord.conf && \
  sed -i -r -f /tmp/supervisor.sed /etc/supervisord.conf && \
  mkdir -pv /etc/supervisor/conf.d /var/log/{novnc,x11vnc,xfce4,xvfb} && \
  mv /tmp/supervisor-*.ini /etc/supervisor/conf.d/ && \
  rm -fr /tmp/supervisor*

CMD ["supervisord", "-c", "/etc/supervisord.conf", "-n"]
