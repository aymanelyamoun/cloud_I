FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add php php-fpm php-mysqli mysql-client php-phar php-cgi php-fileinfo php-json php-curl php-dom php-iconv php-session php-exif php-mbstring php-openssl php-xml php-tokenizer

RUN apk add wget
RUN apk add curl

RUN mkdir -p /usr/share/webapps/
RUN mkdir /var/www
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/bin/wp

RUN adduser -D -g 'www' www
RUN chown -R www:www /var/www/

RUN sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/g' /etc/php83/php-fpm.d/www.conf
# COPY php.ini /etc/php83/conf.d/
EXPOSE 9000

WORKDIR /var/www/wordpress
RUN mkdir /var/run/php
RUN chown -R www:www /var/run/php
COPY set_up.sh set_up.sh
RUN chown www:www set_up.sh

RUN chmod +x set_up.sh

ENTRYPOINT ./set_up.sh && /usr/sbin/php-fpm83 --nodaemonize