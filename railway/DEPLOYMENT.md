# Railway Deployment Notes

This starter is modeled as 3 Railway services:
- `appwrite`
- `mariadb`
- `redis`

## 1) Create services
In the same Railway project, create three services and point them to:
- `services/appwrite`
- `services/mariadb`
- `services/redis`

## 2) Attach volumes
Attach one volume per stateful service:
- `appwrite` -> mount path `/storage`
- `mariadb` -> mount path `/var/lib/mysql`
- `redis` -> mount path `/data`

## 3) Configure `mariadb` variables
Set these in the `mariadb` service:
- `MYSQL_ROOT_PASSWORD`
- `MYSQL_DATABASE=appwrite`
- `MYSQL_USER=appwrite`
- `MYSQL_PASSWORD` (strong random)

## 4) Configure `redis` variables
No required variables for this starter.

## 5) Configure `appwrite` variables
Set these in the `appwrite` service:
- `_APP_ENV=production`
- `_APP_OPENSSL_KEY_V1` (hex random, 32 bytes)
- `_APP_DOMAIN` (for example `api.example.com`)
- `_APP_DOMAIN_TARGET_CNAME` (your Railway-generated target)
- `_APP_SYSTEM_EMAIL_NAME=Appwrite`
- `_APP_SYSTEM_EMAIL_ADDRESS`
- `_APP_SYSTEM_SECURITY_EMAIL_ADDRESS`
- `_APP_DB_HOST` = private domain of `mariadb` service
- `_APP_DB_PORT=3306`
- `_APP_DB_SCHEMA=appwrite`
- `_APP_DB_USER` = same as `MYSQL_USER`
- `_APP_DB_PASS` = same as `MYSQL_PASSWORD`
- `_APP_DB_ROOT_PASS` = same as `MYSQL_ROOT_PASSWORD`
- `_APP_REDIS_HOST` = private domain of `redis` service
- `_APP_REDIS_PORT=6379`
- `_APP_OPTIONS_ROUTER_FORCE_HTTPS=enabled` (for production custom domain)
- `_APP_OPTIONS_ABUSE=enabled`
- `_APP_USAGE_STATS=disabled`
- `_APP_STORAGE_ANTIVIRUS=disabled`
- `_APP_STORAGE_DEVICE=local`
- `_APP_DOMAIN_FUNCTIONS=`
- `_APP_DOMAIN_SITES=`
- `_APP_FUNCTIONS_RUNTIMES=`

## 6) Networking and domains
- Ensure `appwrite` exposes port `80`.
- Add a custom domain in Railway and point DNS as shown by Railway.

## 7) First boot checks
- `mariadb` logs: confirm DB initialized.
- `redis` logs: confirm ready to accept connections.
- `appwrite` logs: confirm migrations complete and HTTP server is up.

## 8) Next hardening pass
- Add backups policy and restore runbook.
- Enable monitoring and alerting.
- Add optional worker split if traffic grows.
