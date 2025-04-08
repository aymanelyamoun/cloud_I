#!/bin/sh

# Replace placeholders in init.sql with the actual environment variables
sed -i "s/{DB_NAME}/$DB_NAME/g" /assets/init.sql
sed -i "s/{DB_USER}/$DB_USER/g" /assets/init.sql
sed -i "s/{DB_USER2}/$DB_USER2/g" /assets/init.sql
sed -i "s/{DB_PASSWORD}/$DB_PASSWORD/g" /assets/init.sql
sed -i "s/{DB_PASSWORD2}/$DB_PASSWORD2/g" /assets/init.sql
#sed -i "s/{DB_NAME}/$DB_NAME/g" /assets/init.sql
#sed -i "s/'root'@'localhost' IDENTIFIED BY '{DB_PASSWORD}'/'root'@'localhost' IDENTIFIED BY '$DB_PASSWORD'/g" /assets/init.sql

