# Appwrite Lite Template (Railway Starter)

This directory is a starting point for a low-footprint Appwrite template on Railway.

Scope of this first version:
- 3 core services: `appwrite`, `mariadb`, `redis`
- Keeps total service count under 4
- Includes local smoke-test stack via Docker Compose
- Includes service Dockerfiles for Railway template packaging

## Why this exists
Railway has high demand for self-hosted OSS templates that run in a small service footprint. This starter focuses on Appwrite with practical defaults and clear env wiring.

## Structure
- `docker-compose.yml`: local stack for quick validation
- `railway-template.json`: Railway template manifest (multi-service)
- `railway-template.schema.json`: same manifest with explicit Railway schema header
- `.env.example`: required runtime values
- `services/appwrite/Dockerfile`: Appwrite service image wrapper
- `services/mariadb/Dockerfile`: MariaDB service image wrapper
- `services/redis/Dockerfile`: Redis service image wrapper
- `railway/DEPLOYMENT.md`: Railway deployment wiring notes
- `scripts/generate-secrets.sh`: generate strong secrets
- `scripts/check-env.sh`: validate required environment variables
- `scripts/bootstrap-env.sh`: create `.env` with generated secrets

## Quick start (local)
1. Generate `.env` with fresh secrets.
```bash
./scripts/bootstrap-env.sh
```
2. Validate env.
```bash
set -a; source .env; ./scripts/check-env.sh
```
3. Start stack.
```bash
docker compose up -d
```
4. Open Appwrite at `http://localhost:8080`.
Use `localhost` (not `127.0.0.1`) because Appwrite routes by configured domain.

## Railway deployment (manual for now)
Follow `railway/DEPLOYMENT.md` to map each service and variables.

## Template manifest
Use one of these files:
- `railway-template.json` (default variant)
- `railway-template.schema.json` (explicit `$schema` variant)

Both define the same 3-service topology and shared variables.

Before publishing:
1. Set your repository URL in the template metadata if needed by your publishing flow.
2. Review default email variables (`SYSTEM_EMAIL_ADDRESS`, `SYSTEM_SECURITY_EMAIL_ADDRESS`).
3. Keep generated secrets stable after first production deploy.

## Current limitations
- This is an initial template scaffold, not full parity with Appwrite's largest production topology.
- Functions/sites are disabled by default in this lightweight setup.
- Production hardening (backup policy, maintenance jobs, alerting) should be added in the next iteration.
