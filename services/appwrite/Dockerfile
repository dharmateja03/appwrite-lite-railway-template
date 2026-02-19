ARG APPWRITE_VERSION=1.8.0
FROM appwrite/appwrite:${APPWRITE_VERSION}

HEALTHCHECK --interval=15s --timeout=5s --start-period=90s --retries=12 CMD php -r 'exit(@file_get_contents("http://127.0.0.1/v1/health/version")===false ? 1 : 0);'
