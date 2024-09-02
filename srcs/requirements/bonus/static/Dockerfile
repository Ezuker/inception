FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y npm
RUN npm install -g http-server

# Copy static website files to /usr/share/http-server
COPY . .

# Set the working directory
RUN mkdir -p /usr/share/http-server
RUN mv ./tools/http-server.html /usr/share/http-server/

# Command to run http-server
CMD ["http-server", "-p", "80"]