FROM alpine/git
WORKDIR /app
RUN git clone https://github.com/shashanktripathi/fantasy.git

FROM maven:3.5-jdk-8-alpine
WORKDIR /app
COPY --from=0 /app/fantasy /app
RUN mvn install

FROM openjdk:8
WORKDIR /app
COPY --from=1 /app/target/docker-fantasy.jar /app
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "docker-fantasy.jar"]

# FROM openjdk:8
# ADD target/docker-fantasy.jar docker-fantasy.jar
# EXPOSE 8080
# ENTRYPOINT ["java", "-jar", "docker-fantasy.jar"]