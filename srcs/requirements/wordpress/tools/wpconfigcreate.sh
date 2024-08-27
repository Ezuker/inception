if [[ -z "$SQL_DATABASE" ]]; then echo "Error : envfile not passed"; exit 1; fi
if [[ -z "$SQL_USER" ]]; then echo "Error : envfile not passed"; exit 1; fi
if [[ -z "$SQL_PASSWORD" ]]; then echo "Error : envfile not passed"; exit 1; fi
if [[ -z "$SQL_ROOT_PASSWORD" ]]; then echo "Error : envfile not passed"; exit 1; fi
if [[ -z "$WP_USER" ]]; then echo "Error : envfile not passed"; exit 1; fi
if [[ -z "$WP_ADMIN_USER" ]]; then echo "Error : envfile not passed"; exit 1; fi
if [[ -z "$WP_ADMIN_PASSWORD" ]]; then echo "Error : envfile not passed"; exit 1; fi
if [[ -z "$WP_USER_PASSWORD" ]]; then echo "Error : envfile not passed"; exit 1; fi
if [[ -z "$WP_USER_EMAIL" ]]; then echo "Error : envfile not passed"; exit 1; fi
if [[ -z "$DOMAIN_NAME" ]]; then echo "Error : envfile not passed"; exit 1; fi


sleep 1;

if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
    mkdir -p /var/www/wordpress
    cd /var/www/wordpress
    wp core download --allow-root --path='/var/www/wordpress'
    wp config create --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb --path='/var/www/wordpress'
    wp core install --allow-root --url=$DOMAIN_NAME --title=jenpeuxplus --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL
    wp user create $WP_USER $WP_USER_EMAIL --role=subscriber --user_pass=$WP_USER_PASSWORD --allow-root
    wp plugin install redis-cache --activate --allow-root
    wp config set WP_REDIS_HOST 'redis' --allow-root
    wp config set WP_REDIS_PORT '6379' --allow-root
    wp config set WP_CACHE true --raw --allow-root
    wp redis enable --allow-root
    chown -R www-data:www-data /var/www/wordpress
    chmod -R 755 /var/www/wordpress
    mkdir -p /run/php
fi

php-fpm7.4 -F
