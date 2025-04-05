#!/bin/bash

# Create www user if not exists
adduser --disabled-password --gecos "" www || true

# Set ownership
chown -R www:www /var/lib/nginx
mkdir -p /var/www && chown -R www:www /var/www

# Replace default config
cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak
cp /assets/nginx.conf /etc/nginx/conf.d/default.conf

# adduser -D -g 'www' www

# chown -R www:www /var/lib/nginx
# chown -R www:www /var/www

# cp /etc/nginx/nginx.conf default.conf
# cp  assets/nginx.conf /etc/nginx/http.d/default.conf
# # cp  assets/nginx.conf /etc/nginx/nginx.conf
