FROM tomcat:9.0-jdk17
COPY foodhub.war /usr/local/tomcat/webapps/
EXPOSE 9090
CMD ["java", "-war","foodhub.war"]
