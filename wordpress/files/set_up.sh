wp core download
wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_USER --dbhost=$DB_HOST --dbpass=$WORDPRESS_PASS
wp core install --url='192.168.56.110' --title="wordpress website" --admin_user=$ADMIN_USER_NAME --admin_password=$ADMIN_PASS --admin_email=$ADMIN_USER_MAIL --skip-email --allow-root

wp user create $USER_NAME $USER_MAIL --role=subscriber --user_pass=$USER_PASS

# wp plugin install redis-cache --activate
# wp config set WP_CACHE true --type=constant 
# wp config set WP_REDIS_HOST $REDIS_HOST --add --allow-root
# wp config set WP_REDIS_PORT 6379 --add --allow-root
# wp redis enable --allow-root

#wp theme install bizboost
#wp theme activate bizboost

