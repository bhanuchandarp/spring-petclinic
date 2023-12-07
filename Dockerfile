FROM ubuntu:latest
MAINTAINER bhanu
ADD ./target/spring-petclinic-3.2.0-SNAPSHOT.jar /opt/
EXPOSE 8080
WORKDIR /opt/
CMD java -jar spring-petclinic-3.2.0-SNAPSHOT.jar
