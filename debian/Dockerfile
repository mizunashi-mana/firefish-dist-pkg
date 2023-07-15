# syntax=docker/dockerfile:1

ARG DISTRO=bookworm
FROM debian:${DISTRO} AS base

SHELL ["bash", "-euxo", "pipefail", "-c"]

ENV WORK_DIR=/workdir
ENV DEBIAN_FRONTEND=noninteractive

COPY scripts/install-deps "${WORK_DIR}/scripts/install-deps"
RUN env TRACE=true "${WORK_DIR}/scripts/install-deps"

FROM base AS builder

COPY scripts "${WORK_DIR}/scripts"
COPY calckey "${WORK_DIR}/calckey"
COPY control.m4 "${WORK_DIR}/control.m4"

RUN <<EOT
env TRACE=true "${WORK_DIR}/scripts/build-source"
rm -rf \
    ~/.local \
    ~/.cache \
    packages/backend/native-utils/target
EOT
RUN env TRACE=true "${WORK_DIR}/scripts/build-deb"
