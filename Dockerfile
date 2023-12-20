FROM maven:3.8-openjdk-8-slim AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:8-jdk-slim
COPY --from=build /target/*.jar FinTech_APP.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","FinTech_APP.jar"]