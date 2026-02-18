# Env Matrix

| Variable | Service | Source |
|---|---|---|
| `MYSQL_ROOT_PASSWORD` | mariadb | generated secret |
| `MYSQL_DATABASE` | mariadb | static (`appwrite`) |
| `MYSQL_USER` | mariadb | static (`appwrite`) |
| `MYSQL_PASSWORD` | mariadb | generated secret |
| `_APP_OPENSSL_KEY_V1` | appwrite | generated secret |
| `_APP_DB_SCHEMA` | appwrite | `MYSQL_DATABASE` |
| `_APP_DB_USER` | appwrite | `MYSQL_USER` |
| `_APP_DB_PASS` | appwrite | `MYSQL_PASSWORD` |
| `_APP_DB_ROOT_PASS` | appwrite | `MYSQL_ROOT_PASSWORD` |
| `_APP_DB_HOST` | appwrite | mariadb private domain |
| `_APP_REDIS_HOST` | appwrite | redis private domain |
