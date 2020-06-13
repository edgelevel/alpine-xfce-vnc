FROM alpine:3.12

ENV DISPLAY :1
ENV RESOLUTION 1024x768x16
#ENV RESOLUTION 1920x1080x24
ENV VNC_PASSWORD=123456

# TODO password: x11vnc -storepasswd $VNC_PASSWORD ~/.vnc/passwd
# TODO novnc
# TODO create gif/readme

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
  xfce4 \
  xvfb \
  x11vnc \
  novnc \
  bash

# setup supervisor
COPY supervisor /tmp/
RUN apk add --no-cache supervisor \
  echo_supervisord_conf > /etc/supervisord.conf && \
  sed -i -r -f /tmp/supervisor.sed /etc/supervisord.conf && \
  mkdir -p /etc/supervisor/conf.d &&
  mv /tmp/supervisor/*.ini /etc/supervisor/conf.d/

CMD ["supervisord", "-c", "/etc/supervisord.conf", "-n"]
