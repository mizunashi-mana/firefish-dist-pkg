# Debian Package Repository of Firefish

## How to Build

```
docker build \
    --target debcontainer \
    --tag ghcr.io/mizunashi-mana/firefish-dist-pkg/debcontainer \
    .
docker create --name deb ghcr.io/mizunashi-mana/firefish-dist-pkg/debcontainer
docker cp deb:/workdir/dest ./dest
docker rm deb
```
