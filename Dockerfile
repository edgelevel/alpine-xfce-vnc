FROM alpine:3.12

ENV DISPLAY :1
# alternative 1024x768x16
ENV RESOLUTION 1920x1080x24

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
  xfce4 \
  faenza-icon-theme \
  xvfb \
  x11vnc \
  novnc \
  bash

# setup supervisor
COPY supervisor /tmp
RUN apk add --no-cache supervisor && \
  echo_supervisord_conf > /etc/supervisord.conf && \
  sed -i -r -f /tmp/supervisor.sed /etc/supervisord.conf && \
  mkdir -p /etc/supervisor/conf.d /var/log/novnc /var/log/x11vnc /var/log/xfce4 /var/log/xvfb && \
  mv /tmp/supervisor-*.ini /etc/supervisor/conf.d/ && \
  rm -fr /tmp/supervisor* && \
  ln -s /usr/share/novnc/vnc.html /usr/share/novnc/index.html

CMD ["supervisord", "-c", "/etc/supervisord.conf", "-n"]
