# Distribution Packages of Firefish

Free to install dev dependencies, build with Rust and use pm2. Run by systemd with security sandbox.

## Debian / Ubuntu

Currently, supports amd64 (x86_64) architecture only.

How to run:

1. Install nodejs v20: https://github.com/nodesource/distributions#debinstall
2. Download deb from https://github.com/mizunashi-mana/firefish-dist-pkg/releases.
3. Install deb by `apt install ./*_firefish.deb`.
4. Edit `/etc/firefish/config.yml` and restart firefish by `systemctl restart firefish`.

## License Notice

The default throughout the repository are dual-licensed under the Mozilla Public License 2.0 (at https://mozilla.org/MPL/2.0/) and the Apache License 2.0 (at https://www.apache.org/licenses/LICENSE-2.0), unless the header specifies another license.

See [LICENSE](./LICENSE).
