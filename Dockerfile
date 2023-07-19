FROM openjdk:17-jdk-slim
WORKDIR /app

COPY CardapioApplication.jar .
EXPOSE 8090

CMD ["java","-jar","CardapioApplication.jar"]