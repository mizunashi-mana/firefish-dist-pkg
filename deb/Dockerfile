# syntax=docker/dockerfile:1

ARG DISTRO_BASE=debian
ARG DISTRO=bookworm
FROM ${DISTRO_BASE}:${DISTRO} AS base

SHELL ["bash", "-euxo", "pipefail", "-c"]

ARG DISTRO

ENV WORK_DIR=/workdir
ENV DEBIAN_FRONTEND=noninteractive

FROM base AS builder

WORKDIR "${WORK_DIR}"

COPY deb/scripts "${WORK_DIR}/scripts"

RUN <<EOT
scripts/install-build-deps

apt-get clean
rm -rf \
    /var/lib/apt/lists/*
EOT

COPY common "${WORK_DIR}/common"
COPY deb/files "${WORK_DIR}/files"
COPY deb/Makefile "${WORK_DIR}/Makefile"

RUN <<EOT
source "$HOME/.cargo/env"
make firefish.deb
EOT

FROM base AS debcontainer

COPY --from=builder "${WORK_DIR}/firefish.deb" "${WORK_DIR}/dest/firefish.deb"

FROM base AS runner

COPY --from=debcontainer "${WORK_DIR}/dest" "${WORK_DIR}/dest"

COPY deb/scripts/install-deb "${WORK_DIR}/scripts/install-deb"
RUN <<EOT
env \
    TRACE=true \
    "DEB_FILE=${WORK_DIR}/dest/firefish.deb" \
    "${WORK_DIR}/scripts/install-deb"

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
