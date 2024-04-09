#!/usr/bin/env bash

set -euo pipefail
[ "${TRACE:-}" = 'true' ] && set -x

while ! env "PGPASSWORD=${POSTGRES_PASSWORD}" \
        psql \
        "--host=${POSTGRES_HOST}" \
        "--user=${POSTGRES_USER}" \
        "--dbname=${POSTGRES_DB}" \
        "--command=CREATE EXTENSION IF NOT EXISTS pgroonga;"; do
    echo 'Retrying...'
    sleep 1
done

tail -f /var/log/faillog
