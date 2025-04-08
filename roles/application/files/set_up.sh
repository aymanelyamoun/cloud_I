#!/bin/sh
# Add a small delay to ensure database is ready
sleep 10

# Check if WordPress files exist but aren't configured
if [ -f "wp-config-sample.php" ] && [ ! -f "wp-config.php" ]; then
    rm -f wp-config.php
    # Create WordPress config
    wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbhost=$DB_HOST --dbpass=$DB_PASSWORD --allow-root
    
    # Install WordPress if not already installed
    if ! wp core is-installed --allow-root; then
        wp core install --url=$DOMAIN_NAME --title="WordPress Website" --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --skip-email --allow-root
        wp user create $USER_NAME $USER_EMAIL --role=subscriber --user_pass=$USER_PASSWORD --allow-root
    fi
else
    # Fresh installation
    if [ ! -f "wp-config.php" ]; then
        wp core download --allow-root
        wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbhost=$DB_HOST --dbpass=$DB_PASSWORD --allow-root
        
        wp core install --url=$DOMAIN_NAME --title="WordPress Website" --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --skip-email --allow-root
        wp user create $USER_NAME $USER_EMAIL --role=subscriber --user_pass=$USER_PASSWORD --allow-root
    else
        echo "WordPress is already installed."
    fi
fi