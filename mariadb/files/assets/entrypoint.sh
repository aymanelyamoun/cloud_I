#!/bin/sh
mariadbd --no-defaults --datadir=/var/lib/mysql --user=root --init-file=/assets/init.sql
#/assets/change_root_pass.sh
