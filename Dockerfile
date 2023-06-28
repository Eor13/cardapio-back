FROM openjdk:17-jdk-slim
VOLUME /tmp
COPY target/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]



#FROM maven:3.9.1-openjdk:17 AS build
#COPY . .
#RUN mvn clean package -Pprod -DskipTests
#
#
#FROM openjdk:17-jdk-slim
#COPY --from=build /target/demo-0.0.1-SNAPSHOT.jar demo.jar
#EXPOSE 8090
#ENTRYPOINT ["java","-jar","demo.jar"]