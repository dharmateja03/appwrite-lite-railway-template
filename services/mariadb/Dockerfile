ARG MARIADB_VERSION=11.4
FROM mariadb:${MARIADB_VERSION}

CMD ["--innodb-flush-method=fsync", "--log-bin-trust-function-creators=1"]
