FROM debian:bullseye

RUN apt update && apt install -y nginx
RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Angouleme/O=42/OU=42/CN=bcarolle.42.fr/UID=bcarolle"
RUN mkdir -p /var/run/nginx
RUN chmod 755 -R /var/www/
RUN chown -R www-data:www-data /var/www/

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY tools/nginxwait.sh /etc/
RUN chmod 755 /etc/nginxwait.sh

CMD ["bash", "/etc/nginxwait.sh"]