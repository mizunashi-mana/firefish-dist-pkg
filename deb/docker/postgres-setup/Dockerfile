# syntax=docker/dockerfile:1
FROM debian:bookworm

SHELL [ "bash", "-euxo", "pipefail", "-c" ]

RUN <<EOT
apt-get update
DEBIAN_FRONTEND=noninteractive \
    apt-get install -y postgresql-client

apt-get clean
rm -rf \
    /var/lib/apt/lists/*
EOT

COPY setup.bash /usr/local/bin/setup.bash

STOPSIGNAL SIGKILL

CMD [ "bash", "setup.bash" ]
