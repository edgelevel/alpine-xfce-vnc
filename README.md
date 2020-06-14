# alpine-xfce-vnc

[Alpine](https://alpinelinux.org) docker image with [Xfce4](https://xfce.org), [x11vnc](http://www.karlrunge.com/x11vnc) and [noVNC](https://novnc.com/info.html)

## Example

Using [TigerVNC](https://tigervnc.org) client

<p align="center">
  <img src="screenshots/tigervnc.png" height="400" alt="tigervnc">
</p>

Using [noVNC](https://novnc.com/info.html) client

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

# tigervnc-viewer
vncviewer localhost:5900

# novnc
xdg-open http://localhost:6080

# cleanup
make docker-clean
```
