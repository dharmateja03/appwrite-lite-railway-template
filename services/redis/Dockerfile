ARG REDIS_VERSION=7.2-alpine
FROM redis:${REDIS_VERSION}

HEALTHCHECK --interval=10s --timeout=3s --start-period=10s --retries=10 CMD ["redis-cli", "ping"]

CMD ["redis-server", "--save", "60", "1000"]
