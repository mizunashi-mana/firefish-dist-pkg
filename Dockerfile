# syntax=docker/dockerfile:1

ARG DISTRO_BASE=debian
ARG DISTRO=bookworm
FROM ${DISTRO_BASE}:${DISTRO} AS base

SHELL ["bash", "-euxo", "pipefail", "-c"]

ARG DISTRO

ENV WORK_DIR=/workdir

FROM base AS builder

WORKDIR "${WORK_DIR}"

COPY scripts "${WORK_DIR}/scripts"
COPY configs "${WORK_DIR}/configs"
COPY debian/files "${WORK_DIR}/debian/files"
COPY Makefile "${WORK_DIR}/Makefile"
COPY envs "${WORK_DIR}/envs"

RUN <<EOT
scripts/install-build-deps

source "$HOME/.cargo/env"
make

apt-get remove -y \
    wget \
    dh-make \
    git \
    make \
    rsync \
    nodejs \
    build-essential \

apt-get autoremove -y
apt-get clean
rm -rf \
    ~/.npm \
    ~/.local \
    ~/.cache \
    ~/.cargo \
    ~/.rustup \
    pkg/firefish-*/* \
    /var/lib/apt/lists/*
EOT

FROM base AS debcontainer

COPY --from=builder "${WORK_DIR}/pkg/*.deb" "${WORK_DIR}/dest/"
COPY --from=builder "${WORK_DIR}/pkg/*.changes" "${WORK_DIR}/dest/"
COPY --from=builder "${WORK_DIR}/pkg/*.buildinfo" "${WORK_DIR}/dest/"
COPY --from=builder "${WORK_DIR}/pkg/*.dsc" "${WORK_DIR}/dest/"

FROM base AS runner

COPY --from=debcontainer "${WORK_DIR}/dest/*.deb" "${WORK_DIR}/dest/"

COPY scripts/install-deb "${WORK_DIR}/scripts/install-deb"
RUN <<EOT
env \
    TRACE=true \
    "DEB_FILE=$(find "${WORK_DIR}/dest/" -name '*.deb')" \
    "${WORK_DIR}/scripts/install-deb"

apt-get clean
rm -rf \
    "${WORK_DIR}/dest" \
    "${WORK_DIR}/scripts" \
    /var/lib/apt/lists/*
EOT

RUN adduser --system firefish
USER firefish

WORKDIR /var/lib/firefish/live/packages/backend

ENV NODE_ENV=production
ENV RUN_MIGRATION_ON_START=true
ENV TRACE=true

CMD ["bash", "-c", "/usr/bin/firefish-prestart-hook && node /var/lib/firefish/live/packages/backend/built/index.js"]
