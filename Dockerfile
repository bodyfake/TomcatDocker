#Bases on Alpine with JDK 8.0 from Oracle
FROM anapsix/alpine-java:8_jdk

MAINTAINER Julian Steffen

###### HTTP HTTPS DEBUG AJP
EXPOSE 9090 9443 9999 9009

ENV TOMCAT_MAJOR 8
ENV TOMCAT_VERSION 8.0.45
ENV TOMCAT_TGZ_URL https://www.apache.org/dyn/closer.cgi?action=download&filename=tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz

ENV CATALINA_HOME=/opt/tomcat

RUN apk add --no-cache tar openssl vim unzip

WORKDIR $CATALINA_HOME

RUN wget -O tomcat.tar.gz "$TOMCAT_TGZ_URL" \
&& tar -xvf tomcat.tar.gz --strip-components=1 \
&& rm bin/*.bat \
&& rm tomcat.tar.gz*
