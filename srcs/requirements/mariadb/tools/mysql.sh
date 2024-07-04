#!bin/sh

if [[ -z "$SQL_DATABASE" ]]; then echo "Erreur : SQL_DATABASE n'est pas défini."; exit 1; fi
if [[ -z "$SQL_USER" ]]; then echo "Erreur : SQL_USER n'est pas défini."; exit 1; fi
if [[ -z "$SQL_PASSWORD" ]]; then echo "Erreur : SQL_PASSWORD n'est pas défini."; exit 1; fi
if [[ -z "$SQL_ROOT_PASSWORD" ]]; then echo "Erreur : SQL_ROOT_PASSWORD n'est pas défini."; exit 1; fi

rm /var/lib/mysql/aria_log*
service mariadb start
mysql_install_db --user=mysql --datadir=/var/lib/mysql

mariadbd --user=root <<EOF

USE mysql;
CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;
CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}'
GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF

mysqladmin -u root -p $SQL_ROOT_PASSWORD shutdown
sleep 5
exec mysqld_safe