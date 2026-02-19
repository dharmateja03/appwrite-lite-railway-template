ARG MARIADB_VERSION=11.4
FROM mariadb:${MARIADB_VERSION}

HEALTHCHECK --interval=10s --timeout=5s --start-period=30s --retries=10 CMD ["healthcheck.sh", "--connect", "--innodb_initialized"]

CMD ["--innodb-flush-method=fsync", "--log-bin-trust-function-creators=1"]
