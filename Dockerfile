FROM tomcat:9.0-jdk17
WORKDIR /usr/local/tomcat
COPY target/foodhub.war /usr/local/tomcat/webapps/
EXPOSE 8080

