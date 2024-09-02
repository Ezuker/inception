if [[ -z "$FTP_USER" ]]; then echo "Error : envfile not passed"; exit 1; fi
if [[ -z "$FTP_PASSWORD" ]]; then echo "Error : envfile not passed"; exit 1; fi

useradd -d /var/www/wordpress $FTP_USER
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd
chown -R $FTP_USER:$FTP_USER /var/www/wordpress
chmod -R 755 /var/www/wordpress

/usr/sbin/proftpd -n