FROM alpine/java:22-jdk

EXPOSE 9090
WORKDIR /app
COPY /var/lib/jenkins/workspace/Pipeline_project/target/foodhub.war .
CMD ["java", "-war","foodhub.war"]
