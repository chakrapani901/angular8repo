FROM ubuntu:latest
MAINTAINER ChaksCorporation
RUN yum -y install httpd
COPY my-sample-app/dist/my-sample-app/* /var/www/html/
CMD [“/usr/sbin/httpd”, “-D”, “FOREGROUND”]
EXPOSE 80
