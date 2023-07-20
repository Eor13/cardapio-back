FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim

WORKDIR /app
COPY --from=build /target/cardapio-back-0.0.1-SNAPSHOT.jar cardapio-back.jar
EXPOSE 8090

ENTRYPOINT ["java","-jar","cardapio-back.jar"]