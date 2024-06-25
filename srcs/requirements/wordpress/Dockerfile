FROM alpine:3.19

RUN apk add lighttpd php82 fcgi php82-cgi openrc
RUN echo "include \"mod_fastcgi.conf\"" >> /etc/lighttpd/lighttpd.conf
RUN sed -i "s|"/usr/bin/php-cgi"|"/usr/bin/php-cgi82"|g" /etc/lighttpd/mod_fastcgi.conf
#RUN rc-service lighttpd start
RUN rc-update add lighttpd default
RUN apk add wget mysql mysql-client php82-mysqli
#RUN rc-service lighttpd stop
#RUN rc-service lighttpd restart

#RUN mkdir -p /usr/share/webapps/
#RUN cd /usr/share/webapps/
#RUN wget https://wordpress.org/latest.tar.gz
#RUN tar -xzvf latest.tar.gz
#RUN rm latest.tar.gz

#RUN chown -R lighttpd /usr/share/webapps/
#RUN ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress

#RUN /usr/bin/mysql_install_db --user=mysql
#RUN rc-service mariadb start && rc-update add mariadb default
#RUN /usr/bin/mysqladmin -u root password 'docker-practice'


#RUN mysql -u root -p
#RUN CREATE DABATASE wordpress;
#RUN GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'127.0.0.1' IDENTIFIED BY 'wordpress-practice';
#RUN FLUSH PRIVILEGES;
#RUN EXIT

EXPOSE 9000
