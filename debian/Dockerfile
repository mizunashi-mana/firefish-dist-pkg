# syntax=docker/dockerfile:1

ARG DISTRO_BASE=debian
ARG DISTRO=bookworm
FROM ${DISTRO_BASE}:${DISTRO} AS base

SHELL ["bash", "-euxo", "pipefail", "-c"]

ARG DISTRO

ENV WORK_DIR=/workdir
ENV DEBIAN_FRONTEND=noninteractive

COPY scripts/params.bash "${WORK_DIR}/scripts/params.bash"
COPY scripts/env.bash "${WORK_DIR}/scripts/env.bash"

FROM base AS builder

COPY scripts/install-deps "${WORK_DIR}/scripts/install-deps"
RUN <<EOT
env TRACE=true "${WORK_DIR}/scripts/install-deps"
apt-get remove -y \
    wget
apt-get autoremove -y
EOT

COPY scripts/build-source "${WORK_DIR}/scripts/build-source"
COPY scripts/build-deb "${WORK_DIR}/scripts/build-deb"
COPY firefish "${WORK_DIR}/firefish"
COPY control.m4 "${WORK_DIR}/control.m4"
RUN <<EOT
env TRACE=true "${WORK_DIR}/scripts/build-source"
apt-get remove -y \
    build-essential \
    git \
    nodejs
apt-get autoremove -y
rm -rf \
    ~/.npm \
    ~/.local \
    ~/.cache \
    ~/.cargo \
    ~/.rustup \
    "${WORK_DIR}/source/packages/backend/native-utils/target"

env TRACE=true "${WORK_DIR}/scripts/build-deb"
apt-get remove -y \
    debhelper \
    devscripts
apt-get autoremove -y
apt-get clean
rm -rf \
    /var/lib/apt/lists/*
EOT

FROM base AS debcontainer

COPY --from=builder "${WORK_DIR}/dest" "${WORK_DIR}/dest"

FROM base AS runner

COPY --from=debcontainer "${WORK_DIR}/dest" "${WORK_DIR}/dest"

COPY scripts/install "${WORK_DIR}/scripts/install"
RUN <<EOT
env TRACE=true "${WORK_DIR}/scripts/install"
apt-get clean
rm -rf \
    "${WORK_DIR}/dest" \
    "${WORK_DIR}/scripts" \
    /var/lib/apt/lists/*
EOT

USER firefish
WORKDIR /var/lib/firefish/live/packages/backend

ENV RUN_MIGRATION_ON_START=true
ENV TRACE=true

CMD ["bash", "-c", "/usr/bin/firefish-prestart-hook && node /var/lib/firefish/live/packages/backend/built/index.js"]
