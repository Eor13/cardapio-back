FROM maven:3.9.1-jdk-17
VOLUME /tmp
COPY target/*.jar app.jar
EXPOSE 8090
ENTRYPOINT ["java","-jar","demo.jar"]