#!/bin/bash
set -e

# Automatically export all subsequently defined variables.
set -a

: ${PGBOUNCER_LOGFILE:="/etc/pgbouncer/logs/pgbouncer.log"}
: ${PGBOUNCER_PIDFILE:="/etc/pgbouncer/tmp/pgbouncer.pid"}
: ${PGBOUNCER_LISTEN_ADDR:="0.0.0.0"}
: ${PGBOUNCER_PORT_NUMBER:="6432"}
: ${PGBOUNCER_AUTH_FILE:="/etc/pgbouncer/conf/userlist.txt"}
: ${PGBOUNCER_ADMIN_USERS:="postgres"}
: ${PGBOUNCER_POOL_MODE:="session"}
: ${POSTGRESQL_DATABASE:="postgres"}
: ${POSTGRESQL_HOST:="postgres"}
: ${POSTGRESQL_PORT_NUMBER:="5432"}
: ${POSTGRESQL_USERNAME:="postgres"}
: ${POSTGRESQL_PASSWORD:="postgres"}

# Stop automatically exporting variables.
set +a

envsubst < /etc/pgbouncer/pgbouncer.ini.template > /etc/pgbouncer/pgbouncer.ini

# Generate the userlist file if it doesn't exist or is empty.
if [ ! -s "${PGBOUNCER_AUTH_FILE}" ]; then
    echo "Creating userlist file: ${PGBOUNCER_AUTH_FILE}"
    # Format: "username" "password"
    echo "\"${POSTGRESQL_USERNAME}\" \"${POSTGRESQL_PASSWORD}\"" > "${PGBOUNCER_AUTH_FILE}"
fi


exec pgbouncer /etc/pgbouncer/pgbouncer.ini

