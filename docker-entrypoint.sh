#!/bin/bash
set -e

MAUTIC_ADDRESS="$( cut -d ',' -f 1 <<< "$VIRTUAL_HOST" )";

echo >&2 "Copying Mutic..."

tar cf - --one-file-system -C /usr/src/mautic . | tar xf -

echo >&2 "Make config..."

cp -rf /var/www/local-template.php /var/www/html/app/config/local.php

sed -i -e "s/MAUTIC_DB_HOST/$MAUTIC_DB_HOST/g" /var/www/html/app/config/local.php
sed -i -e "s/MAUTIC_DB_NAME/$MAUTIC_DB_NAME/g" /var/www/html/app/config/local.php
sed -i -e "s/MAUTIC_DB_PWD/$MAUTIC_DB_PASSWORD/g" /var/www/html/app/config/local.php
sed -i -e "s/MAUTIC_DB_USER/$MAUTIC_DB_USER/g" /var/www/html/app/config/local.php

if [ -n "$SSL" ]; then
  sed -i -e "s/VIRTUAL_HOST/https:\/\/$MAUTIC_ADDRESS/g" /var/www/html/app/config/local.php
else
  sed -i -e "s/VIRTUAL_HOST/http:\/\/$MAUTIC_ADDRESS/g" /var/www/html/app/config/local.php
fi

echo >&2 "Setting permissions..."

chown www-data:www-data app/config/local.php

rm -rf /var/www/html/app/cache

mkdir -p /var/www/html/app/cache

chown -R www-data:www-data /var/www/html/app/cache

mkdir -p /var/www/html/app/logs

chown www-data:www-data /var/www/html/app/logs

echo >&2 " "
echo >&2 "============================ DONE ==================================="
echo >&2 " "

"$@" &
MAINPID=$!

shut_down() {
    if [[ "$MAUTIC_RUN_CRON_JOBS" == "true" ]]; then
        kill -TERM $CRONPID || echo 'Cron not killed. Already gone.'
        kill -TERM $CRONLOGPID || echo 'Cron log not killed. Already gone.'
    fi
    kill -TERM $MAINPID || echo 'Main process not killed. Already gone.'
}
trap 'shut_down;' TERM INT

# wait until all processes end (wait returns 0 retcode)
while :; do
    if wait; then
        break
    fi
done
