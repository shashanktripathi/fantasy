FROM openjdk:8
ADD target/docker-fantasy.jar docker-fantasy.jar
EXPOSE 8085
ENTRYPOINT ["java", "-jar", "docker-fantasy.jar"]