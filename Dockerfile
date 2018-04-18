FROM openjdk:8-jdk-alpine
RUN mkdir -p /usr/src/app
COPY build/libs/echo-fat.jar /usr/src/app/
EXPOSE 5701
WORKDIR /usr/src/app
CMD ["java", "-jar", "/usr/src/app/echo-fat.jar", "-cluster"]
