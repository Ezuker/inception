FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get -y install wget
RUN apt-get install -y php7.3 php-fpm php-mysql mariadb-client
RUN wget https://wordpress.org/wordpress-6.5.5.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.5.5.tar.gz && rm wordpress-6.5.5.tar.gz
RUN chown -R root:root /var/www/wordpress
#COPY conf/wp-config.php /var/www/wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN cd /var/www
COPY tools/wpconfigcreate.sh /var/www
#RUN bash /var/www/wpconfigcreate.sh
