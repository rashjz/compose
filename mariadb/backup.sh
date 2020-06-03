#!/bin/bash
set -x
DATABASE=mysql

until echo '\q' | mysql -h localhost -P3306 -uroot -p"$MYSQL_ROOT_PASSWORD" $DATABASE; do
            >&2 echo "MySQL is unavailable - sleeping"
      sleep 3
done

echo started to restore DB

mysql -uroot --password="$MYSQL_ROOT_PASSWORD" < /tmp/bakuposter.sql
mysql -uroot --password="$MYSQL_ROOT_PASSWORD"< /tmp/handwork.sql
mysql -uroot --password="$MYSQL_ROOT_PASSWORD"< /tmp/lifelog.sql

echo setup completed......

/bin/bash
