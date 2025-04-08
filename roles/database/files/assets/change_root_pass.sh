#!/bin/sh

#mysqld_safe --user=root --datadir=/var/lib/mysql &
mysql -uroot -p $DB_PASSWORD <<EOSQL
ALTER USER 'root'@'localhost' IDENTIFIED BY 'pass';
FLUSH PRIVILEGES;
EOSQL
