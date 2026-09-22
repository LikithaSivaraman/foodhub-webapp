FROM alpine/java:22-jdk

EXPOSE 9090
WORKDIR /app
COPY /target/foodhub.war .
CMD ["java", "-war","foodhub.war"]
