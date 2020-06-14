# alpine-xfce-vnc

![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/edgelevel/alpine-xfce-vnc?style=flat-square)
![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/edgelevel/alpine-xfce-vnc?style=flat-square)
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/edgelevel/alpine-xfce-vnc/latest?color=blueviolet&style=flat-square)
![Docker Image Version (latest semver)](https://img.shields.io/docker/v/edgelevel/alpine-xfce-vnc?style=flat-square)

[Alpine](https://alpinelinux.org) docker image with [Xfce4](https://xfce.org), [x11vnc](http://www.karlrunge.com/x11vnc) and [noVNC](https://novnc.com/info.html)

```bash
# pull latest image
docker run --rm \
  -it -p 5900:5900 -p 6080:6080 \
  --name alpine-xfce-vnc \
  edgelevel/alpine-xfce-vnc
```

Connect using [TigerVNC](https://tigervnc.org) client

```bash
# tigervnc-viewer
vncviewer localhost:5900
```

<p align="center">
  <img src="screenshots/tigervnc.png" height="400" alt="tigervnc">
</p>

Connect using [noVNC](https://novnc.com/info.html) client

```bash
# (mac|linux) novnc via browser
[open|xdg-open] http://localhost:6080
```

<p align="center">
  <img src="screenshots/novnc.png" height="400" alt="novnc">
</p>

## Development

```bash
# build image
make docker-build

# run temporary container
make docker-run

# access container
docker exec -it alpine-xfce-vnc bash
supervisorctl status

# cleanup
make docker-clean
```
