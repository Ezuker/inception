FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y
COPY . .
RUN tar -xvf ./conf/portainer-2.21.0-linux-amd64.tar.gz && \
    mv ./portainer /usr/share/portainer && \
    rm -rf ./conf/portainer-2.21.0-linux-amd64.tar.gz

CMD ["/usr/share/portainer/portainer"]