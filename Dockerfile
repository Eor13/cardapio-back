FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim

WORKDIR /app
COPY --from=build /target/*.jar cardapio-back.jar
EXPOSE 8090

CMD ["java","-jar","/cardapio-back.jar"]