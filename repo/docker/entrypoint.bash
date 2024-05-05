#!/usr/bin/env bash

set -euo pipefail
[ "${TRACE:-false}" = 'true' ] && set -x

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

GPG_KEY_FILE="${GPG_KEY_FILE:-"$PROJECT_DIR/docker/sample-gpg.key"}"
GPG_PASS_FILE="${GPG_PASS_FILE:-"$PROJECT_DIR/docker/sample-gpg.pass"}"
cat "$GPG_KEY_FILE" | gpg --import --batch --yes

"$PROJECT_DIR/scripts/build-repo" --passphrase-file "$GPG_PASS_FILE"
