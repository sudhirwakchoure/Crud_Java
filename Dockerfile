# FROM adoptopenjdk/openjdk11:ubi
# ENV APP_HOME=/usr/app/
# WORKDIR $APP_HOME
# COPY build/libs/*.jar app.jar
# EXPOSE 8080
# CMD ["java","-jar","app.jar"]


FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:resolve

COPY src ./src

CMD ["./mvnw", "spring-boot:run"]
