# syntax=docker/dockerfile:1

FROM debian:bookworm

SHELL ["bash", "-euxo", "pipefail", "-c"]

ENV DEBIAN_FRONTEND=noninteractive
ENV WORK_DIR=/workdir

COPY scripts "${WORK_DIR}/scripts"
COPY calckey "${WORK_DIR}/calckey"
COPY control.m4 "${WORK_DIR}/control.m4"

RUN env TRACE=true "${WORK_DIR}/scripts/build-source"
RUN env TRACE=true "${WORK_DIR}/scripts/build-deb"
