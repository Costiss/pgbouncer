FROM alpine:3.16


RUN apk add --no-cache pgbouncer bash gettext


COPY pgbouncer.ini.template /etc/pgbouncer/pgbouncer.ini.template
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh


# create pgbouncer user
RUN adduser -D -u 1001 pgbouncer
RUN chown -R pgbouncer:pgbouncer /etc/pgbouncer

USER pgbouncer

# Create default directories and files for pgbouncer
RUN mkdir -p /etc/pgbouncer \
    /etc/pgbouncer/logs \ 
    /etc/pgbouncer/tmp \
    /etc/pgbouncer/conf
RUN touch /etc/pgbouncer/conf/userlist.txt \
    /etc/pgbouncer/logs/pgbouncer.pid \
    /etc/pgbouncer/tmp/pgbouncer.log

EXPOSE 6432

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
