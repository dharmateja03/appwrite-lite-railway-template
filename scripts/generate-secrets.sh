#!/usr/bin/env bash
set -euo pipefail

if ! command -v openssl >/dev/null 2>&1; then
  echo "openssl is required" >&2
  exit 1
fi

echo "_APP_OPENSSL_KEY_V1=$(openssl rand -hex 32)"
echo "_APP_DB_PASS=$(openssl rand -base64 24 | tr -d '\n' | tr '+/' 'AZ' | cut -c1-32)"
echo "_APP_DB_ROOT_PASS=$(openssl rand -base64 24 | tr -d '\n' | tr '+/' 'BY' | cut -c1-32)"
echo "MYSQL_ROOT_PASSWORD=<same as _APP_DB_ROOT_PASS>"
