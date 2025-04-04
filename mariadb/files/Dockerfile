FROM alpine:latest

RUN apk update
RUN apk add mysql mysql-client
RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld
RUN mkdir -p /var/lib/mysql
RUN chown -R mysql:mysql /var/lib/mysql
COPY assets assets

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

#RUN assets/setup_mariadb_wordpress.sh
#RUN sed -i 's/#bind-address=0.0.0.0/bind-address=0.0.0.0/g' /etc/my.cnf.d/mariadb-server.cnf

EXPOSE 3306
#CMD ["sh", "-c", "/assets/setup_mariadb_wordpress.sh && mysqld_safe --user=mysql --datadir=/var/lib/mysql"]
#CMD ["/usr/bin/mysqld_safe", "--user=mysql", "--datadir=/var/lib/mysql", "--default-authentication-plugin=mysql_native_password"]
RUN chmod +x assets/replacer.sh
RUN chmod +x assets/change_root_pass.sh
RUN chmod +x assets/entrypoint.sh

#CMD assets/setup_mariadb_wordpress.sh && /usr/bin/mysqld_safe --no-defaults --user=root --datadir=/var/lib/mysql --init-file=/assets/init.sql
#ENTRYPOINT assets/replacer.sh
#RUN /assets/change_root_pass.sh
CMD assets/replacer.sh && assets/entrypoint.sh
#CMD --user=mysql --datadir="/var/lib/mysql" --default-authentication-plugin=mysql_native_password & 
#CMD sh
