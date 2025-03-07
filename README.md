# PgBouncer Docker image

⚠ currently, only one database are supported. If you need more, please open an issue. ⚠

This repository contains the code necessary for building a docker image for [pgbouncer](https://github.com/pgbouncer/pgbouncer).
The image is based on the official pgbouncer code with the configuration file being generated from environment variables.

## Environment variables

The following environment variables are used to configure pgbouncer:

config reference: https://www.pgbouncer.org/config.html

| Configuration Parameter | Environment Variable     | Default                             |
| ----------------------- | ------------------------ | ----------------------------------- |
| `logfile`               | `PGBOUNCER_LOGFILE`      | `/etc/pgbouncer/logs/pgbouncer.log` |
| `pidfile`               | `PGBOUNCER_PIDFILE`      | `/etc/pgbouncer/tmp/pgbouncer.pid`  |
| `listen_addr`           | `PGBOUNCER_LISTEN_ADDR`  | `0.0.0.0`                           |
| `listen_port`           | `PGBOUNCER_PORT_NUMBER`  | `6432`                              |
| `auth_file`             | `PGBOUNCER_AUTH_FILE`    | `/etc/pgbouncer/conf/userlist.txt`  |
| `admin_users`           | `PGBOUNCER_ADMIN_USERS`  | `postgres`                          |
| `pool_mode`             | `PGBOUNCER_POOL_MODE`    | `session`                           |
| N/A                     | `POSTGRESQL_DATABASE`    | `postgres`                          |
| N/A                     | `POSTGRESQL_HOST`        | `postgres`                          |
| N/A                     | `POSTGRESQL_PORT_NUMBER` | `5432`                              |
| N/A                     | `POSTGRESQL_USERNAME`    | `postgres`                          |
| N/A                     | `POSTGRESQL_PASSWORD`    | `postgres`                          |

## Usage

To run the container, you can use the following command:

```bash
docker run -d \
  -e POSTGRESQL_HOST=postgres \
  -e POSTGRESQL_PORT_NUMBER=5432 \
  -e POSTGRESQL_USERNAME=postgres \
  -e POSTGRESQL_PASSWORD=postgres \
  -p 6432:6432 \
  --name pgbouncer \
  costiss/pgbouncer
```

or with docker compose

```yaml
services:
  pgbouncer:
    image: costiss/pgbouncer:latest
    environment:
      POSTGRESQL_HOST: db
      POSTGRESQL_PORT_NUMBER: 5432
      POSTGRESQL_USER: postgres
      POSTGRESQL_PASSWORD: postgres
    ports:
      - 6432:6432
    depends_on:
      - db

  db:
    image: postgres:latest
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
      POSTGRES_DB: postgres
```
