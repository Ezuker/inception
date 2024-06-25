FROM alpine:3.19

RUN apk update && apk upgrade && apk add openrc
RUN apk add mariadb mariadb-client
RUN mkdir -p /run/openrc/
RUN touch /run/openrc/softlevel
RUN /etc/init.d/mariadb setup
RUN rc-update add mariadb default
EXPOSE 330
