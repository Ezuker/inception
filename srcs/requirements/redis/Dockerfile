FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install redis-server -y
RUN apt-get install redis-tools -y
RUN apt-get install php-redis -y
COPY . .
RUN mv /conf/redis.conf /etc/redis/redis.conf
RUN chmod 777 /etc/redis/redis.conf

CMD ["bash", "/tools/redis.sh"]