FROM debian:bookworm

SHELL ["bash", "-euxo", "pipefail", "-c"]

RUN <<EOT
apt-get update -y
DEBIAN_FRONTEND=noninteractive apt-get install -y \
    gnupg

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A0546A43624A8331
echo 'deb http://repo.aptly.info/ squeeze main' > /etc/apt/sources.list.d/aptly.list

apt-get update -y
DEBIAN_FRONTEND=noninteractive apt-get install -y \
    aptly

apt-get clean
rm -rf /var/lib/apt/lists/*
EOT
