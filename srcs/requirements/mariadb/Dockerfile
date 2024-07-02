FROM debian:bullseye

RUN apt update -y && apt upgrade -y
RUN apt-get install mariadb-server -y
RUN apt-get install systemctl -y
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/mysql.sh /etc/mysql.sh
RUN mkdir -p /var/lib/mysql
RUN chown mysql:mysql /var/lib/mysql
RUN chmod 755 /var/lib/mysql
RUN mkdir -p /var/run/mysqld
RUN chown mysql:mysql /var/run/mysqld
RUN chmod 755 /var/run/mysqld
#RUN systemctl start mysql 
#RUN sh /etc/mysql.sh
#USER mysql

#CMD ["/usr/bin/mysqld"]
