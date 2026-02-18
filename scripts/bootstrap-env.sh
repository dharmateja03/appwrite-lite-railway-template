#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
ENV_FILE="$ROOT_DIR/.env"

if [[ -f "$ENV_FILE" ]]; then
  echo ".env already exists at $ENV_FILE" >&2
  echo "Remove it first if you want to regenerate secrets." >&2
  exit 1
fi

cp "$ROOT_DIR/.env.example" "$ENV_FILE"

replace_env_value() {
  local key="$1"
  local value="$2"
  local tmp
  tmp="$(mktemp)"
  awk -v k="$key" -v v="$value" '
    BEGIN { replaced=0 }
    $0 ~ "^" k "=" {
      print k "=" v
      replaced=1
      next
    }
    { print }
    END {
      if (!replaced) {
        print k "=" v
      }
    }
  ' "$ENV_FILE" > "$tmp"
  mv "$tmp" "$ENV_FILE"
}

while IFS= read -r line; do
  key="${line%%=*}"
  value="${line#*=}"
  if [[ "$key" == "_APP_DB_ROOT_PASS" ]]; then
    replace_env_value "_APP_DB_ROOT_PASS" "$value"
    replace_env_value "MYSQL_ROOT_PASSWORD" "$value"
  else
    replace_env_value "$key" "$value"
  fi
done < <("$ROOT_DIR/scripts/generate-secrets.sh" | grep -E '^(_APP_OPENSSL_KEY_V1|_APP_DB_PASS|_APP_DB_ROOT_PASS)=')

echo "Created $ENV_FILE with fresh secrets."
