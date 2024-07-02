FROM debian:bullseye

RUN apt update -y && apt upgrade -y
RUN apt-get install default-mysql-server -y
RUN apt-get install mariadb-server -y
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/mysql.sh /etc/mysql
ENTRYPOINT ["bash","/etc/mysql/mysql.sh"]
