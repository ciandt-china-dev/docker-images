#!/bin/bash
set -e

if [ "$(id -u docker)" != "${CURRENT_USER_UID:-1000}" ]; then
    usermod -u "${CURRENT_USER_UID:-1000}" docker
fi

if [ "$(id -g docker)" != "${CURRENT_USER_GID:-1001}" ]; then
    groupmod -g "${CURRENT_USER_GID:-1001}" docker
fi

if [ ! -e /usr/bin/mariadb-dump ]; then
    ln -s /usr/bin/mysqldump /usr/bin/mariadb-dump
fi
nohup rsyslogd -n -f /etc/rsyslog.conf >/var/log/rsyslogd.log 2>&1 &
update-ca-certificates
service exim4 start || true
php-fpm -D
exec apache2-foreground
