# syntax=docker/dockerfile:1

ARG DISTRO=bookworm
FROM debian:${DISTRO} AS base

SHELL ["bash", "-euxo", "pipefail", "-c"]

ENV WORK_DIR=/workdir
ENV DEBIAN_FRONTEND=noninteractive

COPY scripts/params.bash "${WORK_DIR}/scripts/params.bash"
COPY scripts/env.bash "${WORK_DIR}/scripts/env.bash"

FROM base AS builder

COPY scripts/install-deps "${WORK_DIR}/scripts/install-deps"
COPY scripts/build-source "${WORK_DIR}/scripts/build-source"
COPY firefish "${WORK_DIR}/firefish"
COPY control.m4 "${WORK_DIR}/control.m4"
RUN <<EOT
env TRACE=true "${WORK_DIR}/scripts/install-deps"
env TRACE=true "${WORK_DIR}/scripts/build-source"
apt-get remove -y \
    git \
    build-essential \
    nodejs
apt-get autoremove -y
apt-get clean
rm -rf \
    ~/.npm \
    ~/.local \
    ~/.cache \
    ~/.cargo \
    ~/.rustup \
    "${WORK_DIR}/source/packages/backend/native-utils/target" \
    /var/lib/apt/lists/*
EOT

COPY scripts/build-deb "${WORK_DIR}/scripts/build-deb"
RUN env TRACE=true "${WORK_DIR}/scripts/build-deb"

FROM base AS runner

COPY --from=builder "${WORK_DIR}/dest" "${WORK_DIR}/dest"

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

ARG RUN_MIGRATION_ON_START=true

CMD ["bash", "-c", "/usr/bin/firefish-prestart-hook && node /var/lib/firefish/live/packages/backend/built/index.js"]
