# alpine-xfce-vnc

> TODO description

* DockerHub
* Helm chart

## Development

Temporary images for testing

```bash
# alpine
docker run --rm --name alpine -it alpine:edge

# ubuntu
docker run --rm --name phusion phusion/baseimage:master-amd64
docker exec -it phusion bash

docker exec -it alpine-xfce-vnc bash
supervisorctl status

http://localhost:6080/vnc.html
```
