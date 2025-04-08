#!/bin/sh

# Replace placeholders in init.sql with the actual environment variables
sed -i "s/{DB_NAME}/$DB_NAME/g" /assets/init.sql
sed -i "s/{DB_USER}/$DB_USER/g" /assets/init.sq
sed -i "s/{DB_PASSWORD}/$DB_PASSWORD/g" /assets/init.sql
sed -i "s/{DB_ROOT_PASSWORD}/$DB_ROOT_PASSWORD/g" /assets/init.sql

