if [[ -z "$SQL_DATABASE" ]]; then echo "Erreur : SQL_DATABASE n'est pas défini."; exit 1; fi
if [[ -z "$SQL_USER" ]]; then echo "Erreur : SQL_USER n'est pas défini."; exit 1; fi
if [[ -z "$SQL_PASSWORD" ]]; then echo "Erreur : SQL_PASSWORD n'est pas défini."; exit 1; fi
if [[ -z "$SQL_ROOT_PASSWORD" ]]; then echo "Erreur : SQL_ROOT_PASSWORD n'est pas défini."; exit 1; fi

sleep 10;

wp config create --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306 --path='/var/www/wordpress'
wp core install --allow-root --url=bcarolle.42.fr --title=jsp --admin-user=$SQL_USER --admin-password=$SQL_PASSWORD --admin-email=benoit.carolle.pro@gmail.com

mkdir -p /run/php

/usr/sbin/php-fpm7.3 -F
