FROM tomcat:9.0-jdk21
COPY target/foodhub.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["java", "-war","foodhub.war"]
