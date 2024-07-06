FROM debian:bullseye

RUN apt update -y
RUN apt-get install mariadb-server -y
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/mysql.sh /etc/mysql.sh
RUN chown -R mysql:mysql /var/lib/mysql
RUN chmod +x /etc/mysql.sh

RUN mkdir -p /run/mysqld

CMD ["/etc/mysql.sh"]
