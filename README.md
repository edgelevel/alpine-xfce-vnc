# alpine-xfce-vnc

Lightweight Alpine image with Xfce, VNC and novnc

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
