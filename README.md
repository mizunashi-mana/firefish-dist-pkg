# Debian Package Repository of Firefish

Free to install dev dependencies, build with Rust and use pm2. Run by systemd with security sandbox.

## How to Use

### Debian

WIP

### Ubuntu

WIP

## How to Build Package

```
docker build \
    --target debcontainer \
    --tag ghcr.io/mizunashi-mana/firefish-dist-pkg/debcontainer \
    .
docker create --name deb ghcr.io/mizunashi-mana/firefish-dist-pkg/debcontainer
docker cp deb:/workdir/dest ./dest
docker rm deb
```

## How to Build Repository

```
./repo/scripts/build-repo-in-docker
npx http-server ./repo/dest
```

and, use

```
deb [signed-by=./repo/docker/sample-gpg.key] http://localhost:8080 <dist> main
```

## License Notice

The default throughout the repository are dual-licensed under the Mozilla Public License 2.0 (at https://mozilla.org/MPL/2.0/) and the Apache License 2.0 (at https://www.apache.org/licenses/LICENSE-2.0), unless the header specifies another license.

See [LICENSE](./LICENSE).
