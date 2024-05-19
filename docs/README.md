# A Firefish Distribution Repository

Free to install dev dependencies, build with Rust and use pm2. Run by systemd with security sandbox.

## How to Use

Support the below distributions only:

* Debian bookworm
* Ubuntu noble
* Ubuntu jammy

```
apt update
apt install -y ca-certificates lsb-release curl
curl --output /usr/share/keyrings/firefish-dist-pkg.gpg \
    -fsSL https://mizunashi-mana.github.io/firefish-dist-pkg/repo.gpg
echo "deb [signed-by=/usr/share/keyrings/firefish-dist-pkg.gpg] https://mizunashi-mana.github.io/firefish-dist-pkg $(lsb_release --short --codename) main" \
    | tee /etc/apt/sources.list.d/firefish-dist-pkg.list

curl -fsSL https://deb.nodesource.com/setup_20.x | bash -

apt update
apt install -y firefish
```

## License Notice

The default throughout the repository are dual-licensed under the Mozilla Public License 2.0 (at https://mozilla.org/MPL/2.0/) and the Apache License 2.0 (at https://www.apache.org/licenses/LICENSE-2.0), unless the header specifies another license.

See [LICENSE](./LICENSE).
