FROM openjdk:17-jdk-slim
VOLUME /tmp
COPY target/*.jar app.jar
EXPOSE 8090
ENTRYPOINT ["java","-jar","demo.jar"]