#!/usr/bin/env bash

FIREFISH_SOURCE_GIT_REPO="${FIREFISH_SOURCE_GIT_REPO:-"https://git.joinfirefish.org/firefish/firefish.git"}"

FIREFISH_SOURCE_VERSION="${FIREFISH_SOURCE_VERSION:-"v1.0.3"}"
NODE_MAJOR_VERSION="${NODE_MAJOR_VERSION:-20}"

PKG_VERSION_MAIN="$(echo "${FIREFISH_SOURCE_VERSION}" | tr -d v | tr '-' '+')"
PKG_VERSION="${PKG_VERSION_MAIN}-$(date +%Y%m%d%H%M%S)-node${NODE_MAJOR_VERSION}"

WORK_DIR="${WORKDIR:-"$(cd "$(dirname "$0")/.." && pwd)"}"

SOURCE_DIR="${WORK_DIR}/source"
INSTALL_DIR="${WORK_DIR}/install"
