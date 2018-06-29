FROM jenkins:latest

COPY plugins.txt .
RUN /usr/local/bin/install-plugins.sh `cat plugins.txt`

EXPOSE 8080 50000