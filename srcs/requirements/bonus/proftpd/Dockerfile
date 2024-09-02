FROM debian:latest

RUN apt-get update && apt-get install -y proftpd
COPY . .
RUN mv /conf/proftpd.conf /etc/proftpd/proftpd.conf

# Run the proftpd.sh script
CMD ["bash", "/tools/proftpd.sh"]