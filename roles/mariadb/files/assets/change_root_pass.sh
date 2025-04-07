#!/bin/sh

#mysqld_safe --user=root --datadir=/var/lib/mysql &
mysql -uroot -p $WORDPRESS_PASS <<EOSQL
ALTER USER 'root'@'localhost' IDENTIFIED BY 'pass';
FLUSH PRIVILEGES;
EOSQL
