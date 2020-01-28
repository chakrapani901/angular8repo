FROM ubuntu:latest
MAINTAINER ChaksCorporation
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install apache2
RUN apt-get -y install httpd
COPY my-sample-app/dist/my-sample-app/* . /var/www/html/
CMD [“/usr/sbin/httpd”, “-D”, “FOREGROUND”]
EXPOSE 80
