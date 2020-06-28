# alpine-xfce-vnc

[![Docker Cloud Build Status][build-image]][build-url]
[![Docker Cloud Automated build][build-automated-image]][build-automated-url]
[![Docker Image Size (tag)][size-image]][size-url]
[![GitHub tag (latest by date)][tag-image]][tag-url]

[build-image]: https://img.shields.io/docker/cloud/build/edgelevel/alpine-xfce-vnc?style=flat-square
[build-url]: https://hub.docker.com/r/edgelevel/alpine-xfce-vnc
[build-automated-image]: https://img.shields.io/docker/cloud/automated/edgelevel/alpine-xfce-vnc?style=flat-square
[build-automated-url]: https://hub.docker.com/r/edgelevel/alpine-xfce-vnc/builds
[size-image]: https://img.shields.io/docker/image-size/edgelevel/alpine-xfce-vnc/latest?color=blueviolet&style=flat-square
[size-url]: https://hub.docker.com/r/edgelevel/alpine-xfce-vnc
[tag-image]: https://img.shields.io/github/v/tag/edgelevel/alpine-xfce-vnc?color=orange&style=flat-square
[tag-url]: https://hub.docker.com/r/edgelevel/alpine-xfce-vnc/tags

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

Connect using [noVNC](https://novnc.com/info.html) via browser

```bash
# (mac|linux) novnc
[open|xdg-open] http://localhost:6080
```

<p align="center">
  <img src="screenshots/novnc.png" height="400" alt="novnc">
</p>

## Development

```bash
# build images [base|web]
make docker-build

# run temporary container
make docker-run tag=base

# access container
docker exec -it alpine-xfce-vnc bash
supervisorctl status

# cleanup
make docker-clean
```
