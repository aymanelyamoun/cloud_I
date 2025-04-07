#!/bin/sh

# Replace placeholders in init.sql with the actual environment variables
sed -i "s/{WORDPRESS_DB_NAME}/$WORDPRESS_DB_NAME/g" /assets/init.sql
sed -i "s/{WORDPRESS_USER}/$WORDPRESS_USER/g" /assets/init.sql
sed -i "s/{WORDPRESS_USER2}/$WORDPRESS_USER2/g" /assets/init.sql
sed -i "s/{WORDPRESS_PASS}/$WORDPRESS_PASS/g" /assets/init.sql
sed -i "s/{WORDPRESS_PASS2}/$WORDPRESS_PASS2/g" /assets/init.sql
#sed -i "s/{WORDPRESS_DB_NAME}/$WORDPRESS_DB_NAME/g" /assets/init.sql
#sed -i "s/'root'@'localhost' IDENTIFIED BY '{WORDPRESS_PASS}'/'root'@'localhost' IDENTIFIED BY '$WORDPRESS_PASS'/g" /assets/init.sql

