#!/usr/bin/env bash

CALCKEY_SOURCE_GIT_REPO="${CALCKEY_SOURCE_GIT_REPO:-"https://codeberg.org/calckey/calckey.git"}"

CALCKEY_SOURCE_VERSION="${CALCKEY_SOURCE_VERSION:-v14.0.0-rc3}"
NODE_MAJOR_VERSION="${NODE_MAJOR_VERSION:-20}"

PKG_VERSION_MAIN="$(echo "${CALCKEY_SOURCE_VERSION}" | sed -E 's/v([0-9.]+)-(.+)/\1+\2/')"
PKG_VERSION="${PKG_VERSION_MAIN}-$(date +%Y%m%d%H%M%S)-node${NODE_MAJOR_VERSION}"

WORK_DIR="${WORKDIR:-"$(cd "$(dirname "$0")/.." && pwd)"}"

SOURCE_DIR="${WORK_DIR}/source"
INSTALL_DIR="${WORK_DIR}/install"
