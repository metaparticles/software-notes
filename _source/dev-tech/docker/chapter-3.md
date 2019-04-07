---
title: Chapter 3 - Networking
---

[Chapter 2](/software-notes/dev-tech/docker/chapter-2)

## Chapter 3 - Networking

docker networks or docker network ls
docker bridge (or docker network bridge)
docker ps
docker network create {network-name} -d bridge
docker inspect {network-name}
docker run -it --network none {image-name} /bin/bash -> to disable networking completely
docker run -it --network host {image-name} /bin/bash -> attach to host network directly

For multi-host networking, we use `overlay` network. Overlay networks use a service discovery mechanism. For example, docker swarm creates an overlay network by default.

Connecting Micro-Services
docker compose
