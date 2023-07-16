# syntax=docker/dockerfile:1

ARG DISTRO=bookworm
FROM debian:${DISTRO} AS base

SHELL ["bash", "-euxo", "pipefail", "-c"]

ENV WORK_DIR=/workdir
ENV DEBIAN_FRONTEND=noninteractive

COPY scripts/env.bash "${WORK_DIR}/scripts/env.bash"
COPY scripts/install-deps "${WORK_DIR}/scripts/install-deps"
RUN env TRACE=true "${WORK_DIR}/scripts/install-deps"

FROM base AS builder

COPY calckey "${WORK_DIR}/calckey"
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

COPY scripts/test "${WORK_DIR}/scripts/test"
CMD [ "${WORK_DIR}/scripts/test" ]
