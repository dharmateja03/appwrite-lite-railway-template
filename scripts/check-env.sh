#!/usr/bin/env bash
set -euo pipefail

required=(
  _APP_OPENSSL_KEY_V1
  _APP_DB_SCHEMA
  _APP_DB_USER
  _APP_DB_PASS
  _APP_DB_ROOT_PASS
  MYSQL_ROOT_PASSWORD
  _APP_SYSTEM_EMAIL_ADDRESS
  _APP_SYSTEM_SECURITY_EMAIL_ADDRESS
)

missing=0
for var in "${required[@]}"; do
  if [[ -z "${!var:-}" ]]; then
    echo "Missing required env var: $var" >&2
    missing=1
  fi
done

if [[ "${MYSQL_ROOT_PASSWORD:-}" != "${_APP_DB_ROOT_PASS:-}" ]]; then
  echo "MYSQL_ROOT_PASSWORD and _APP_DB_ROOT_PASS must match" >&2
  missing=1
fi

if [[ "$missing" -ne 0 ]]; then
  exit 1
fi

echo "Environment check passed"
