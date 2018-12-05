# debian-crystal
[![License badge][license-img]](LICENSE)
[![Docker badge][docker-img]][docker-url]

This is a Debian Jessie docker image with crystal and icr installed.

##Prerequisites

- Docker

## Usage

It open an ICR per default.

```text
docker pull yueyehua/debian-crystal-icr
docker run \
  -ti                                            # interactive
  --rm                                           # remove once done
  --name crystal \                               # container name
  -h crystal \                                   # hostname
  yueyehua/debian-crystal
```

[license-img]: https://img.shields.io/badge/license-Apache-blue.svg
[docker-img]: https://img.shields.io/docker/pulls/yueyehua/crystal.svg
[docker-url]: https://registry.hub.docker.com/u/yueyehua/crystal
