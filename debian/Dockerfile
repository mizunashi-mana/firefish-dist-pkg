# syntax=docker/dockerfile:1

ARG DISTRO=bookworm
FROM debian:${DISTRO} AS base

SHELL ["bash", "-euxo", "pipefail", "-c"]

ENV WORK_DIR=/workdir
ENV DEBIAN_FRONTEND=noninteractive

COPY scripts/env.bash "${WORK_DIR}/scripts/env.bash"

FROM base AS builder

COPY scripts/install-deps "${WORK_DIR}/scripts/install-deps"
RUN env TRACE=true "${WORK_DIR}/scripts/install-deps"

COPY firefish "${WORK_DIR}/firefish"
COPY control.m4 "${WORK_DIR}/control.m4"

COPY scripts/build-source "${WORK_DIR}/scripts/build-source"
RUN <<EOT
env TRACE=true "${WORK_DIR}/scripts/build-source"
rm -rf \
    ~/.npm \
    ~/.local \
    ~/.cache \
    packages/backend/native-utils/target
EOT

COPY scripts/build-deb "${WORK_DIR}/scripts/build-deb"
RUN env TRACE=true "${WORK_DIR}/scripts/build-deb"

FROM base AS runner

COPY --from=builder "${WORK_DIR}/dest" "${WORK_DIR}/dest"

COPY scripts/install "${WORK_DIR}/scripts/install"
RUN <<EOT
env TRACE=true "${WORK_DIR}/scripts/install"
rm -rf "${WORK_DIR}/dest"

apt-get clean
rm -rf /var/lib/apt/lists/*
EOT

USER firefish
ENV RUN_MIGRATION_ON_START=true

CMD ["/usr/bin/firefish-start"]
