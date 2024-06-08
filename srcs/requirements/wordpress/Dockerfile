FROM alpine:3.19

RUN apk add lighttpd php82 fcgi php82-cgi
RUN sed -i "s|#include "mod_fastcgi.conf"|include "mod_fastcgi.conf"|g" /etc/lighttpd/lighttpd.conf
RUN sed -i "s|"bin-path" => "/usr/bin/php-cgi"|"bin-path" => "/usr/bin/php-cgi82"|g" /etc/lighttpd/mod_fastcgi.conf
CMD rc-service lighttpd start
CMD rc-update add lighttpd default
RUN apk add wget mysql mysql-client php82-mysqli
CMD rc-service lighttpd restart

RUN mkdir -p /usr/share/webapps/
RUN cd /usr/share/webapps/
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz
RUN rm latest.tar.gz

RUN chown -R lighttpd /usr/share/webapps/
RUN ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress

RUN /usr/bin/mysql_install_db --user=mysql
CMD rc-service mariadb start && rc-update add mariadb default
RUN /usr/bin/mysqladmin -u root password 'docker-practice'

RUN mysql -u root -p
RUN CREATE DABATASE wordpress;
RUN GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'127.0.0.1' IDENTIFIED BY 'wordpress-practice';
RUN FLUSH PRIVILEGES;
RUN EXIT
EXPOSE 9000
