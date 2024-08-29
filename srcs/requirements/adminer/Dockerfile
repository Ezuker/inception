FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y adminer apache2
RUN apt-get install -y systemctl

# Configure Apache to serve Adminer
RUN echo "Alias /adminer.php /usr/share/adminer/adminer.php" | tee /etc/apache2/conf-available/adminer.conf
RUN a2enconf adminer

# Set ServerName to localhost to suppress the warning
# RUN echo "Adminer website" | tee /etc/apache2/conf-available/servername.conf
# RUN a2enconf servername

# Start Apache in the foreground
RUN systemctl start apache2

CMD ["apachectl", "-D", "FOREGROUND"]