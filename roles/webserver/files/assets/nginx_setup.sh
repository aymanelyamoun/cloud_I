#!/bin/bash

# Create www user if not exists
adduser --disabled-password --gecos "" www || true

# Set ownership
chown -R www:www /var/lib/nginx
mkdir -p /var/www && chown -R www:www /var/www

