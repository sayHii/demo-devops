FROM openjdk:17-slim
RUN apt update && apt upgrade -y && apt autoremove -y
WORKDIR /Tools/app
COPY ./target/*.jar app.jar
EXPOSE  8080
ENTRYPOINT ["sh", "-c", "java ${JAVA_OPTS} -jar app.jar ${JAVA_OPTS_SUFFIX}"]