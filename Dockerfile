FROM ubuntu:latest
MAINTAINER ChaksCorporation
RUN apt-get update
RUN apt-get -y install curl
RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat
RUN curl -O https://www-eu.apache.org/dist/tomcat/tomcat-9/v9.0.30/bin/apache-tomcat-9.0.30.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-9.0.30/* /opt/tomcat/.
RUN apt-get -y install openjdk-8-jdk
RUN java -version
WORKDIR /opt/tomcat/webapps
RUN mkdir ngapp
#WORKDIR /home/chakrapanibegari/Downloads/angular8repo-master/my-sample-app/dist/
COPY my-sample-app/dist/my-sample-app /opt/tomcat/webapps/ngapp/
WORKDIR /opt/tomcat/webapps
#RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
