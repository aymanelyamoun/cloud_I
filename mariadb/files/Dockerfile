FROM alpine:latest

RUN apk update
RUN apk add mysql mysql-client
RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld
RUN mkdir -p /var/lib/mysql
RUN chown -R mysql:mysql /var/lib/mysql
COPY assets assets

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306
RUN chmod +x assets/replacer.sh
RUN chmod +x assets/entrypoint.sh

CMD assets/replacer.sh && assets/entrypoint.sh
