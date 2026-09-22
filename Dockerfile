FROM jetty:11-jdk17
COPY foodhub.war /var/lib/jetty/webapps/root.war
EXPOSE 9090
CMD ["java", "-war","foodhub.war"]
