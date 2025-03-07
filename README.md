# PgBouncer Docker image

This repository contains the code necessary for building a docker image for [pgbouncer](https://github.com/pgbouncer/pgbouncer).
The image is based on the official pgbouncer image, but the configuration file is generated from environment variables.

## Environment variables

The following environment variables are used to configure pgbouncer:

| Variable                 | Description                       | Default                             |
| ------------------------ | --------------------------------- | ----------------------------------- |
| `PGBOUNCER_LOGFILE`      | Path to the log file              | `/etc/pgbouncer/logs/pgbouncer.log` |
| `PGBOUNCER_PIDFILE`      | Path to the pid file              | `/etc/pgbouncer/tmp/pgbouncer.pid`  |
| `PGBOUNCER_LISTEN_ADDR`  | Address to listen on              | `0.0.0.0`                           |
| `PGBOUNCER_PORT_NUMBER`  | Port to listen on                 | `6432`                              |
| `PGBOUNCER_AUTH_FILE`    | Path to the userlist file         | `/etc/pgbouncer/conf/userlist.txt`  |
| `PGBOUNCER_ADMIN_USERS`  | Users with admin privileges       | `postgres`                          |
| `PGBOUNCER_POOL_MODE`    | Pooling mode                      | `session`                           |
| `POSTGRESQL_DATABASE`    | Database to connect to            | `postgres`                          |
| `POSTGRESQL_HOST`        | Hostname of the PostgreSQL server | `postgres`                          |
| `POSTGRESQL_PORT_NUMBER` | Port of the PostgreSQL server     | `5432`                              |
| `POSTGRESQL_USERNAME`    | Username to connect with          | `postgres`                          |
| `POSTGRESQL_PASSWORD`    | Password to connect with          | `postgres`                          |

## Usage

To run the container, you can use the following command:

```bash
https://github.com/Costiss/pgbouncer.git
cd pgbouncer
docker build -t pgbouncer .
docker run -d \
  -e POSTGRESQL_HOST=postgres \
  -e POSTGRESQL_PORT_NUMBER=5432 \
  -e POSTGRESQL_USERNAME=postgres \
  -e POSTGRESQL_PASSWORD=postgres \
  -p 6432:6432 \
  --name pgbouncer \
  pgbouncer
```
