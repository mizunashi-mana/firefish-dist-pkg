# syntax=docker/dockerfile:1

FROM debian:bookworm

SHELL ["bash", "-euxo", "pipefail", "-c"]

ENV DEBIAN_FRONTEND=noninteractive
ENV WORK_DIR=/workdir

RUN <<EOS
mkdir -p "${WORK_DIR}/scripts"
EOS

COPY scripts/env.bash "${WORK_DIR}/scripts/env.bash"

COPY --chmod=0755 scripts/build-source "${WORK_DIR}/scripts/build-source"
RUN env TRACE=true "${WORK_DIR}/scripts/build-source"

COPY --chmod=0755 scripts/build-deb "${WORK_DIR}/scripts/build-deb"
COPY calckey "${WORK_DIR}/calckey"
RUN env TRACE=true "${WORK_DIR}/scripts/build-deb"
