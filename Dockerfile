FROM openjdk:17-slim
RUN apt update && apt upgrade -y && apt autoremove -y
COPY ./lib/jrebel.jar /jrebel.jar
COPY ./lib/libjrebel64.so /lib/libjrebel64.so
EXPOSE  8080
WORKDIR /Tools/app
COPY demo*.jar app.jar
ENTRYPOINT ["sh", "-c", "java ${JAVA_OPTS} -jar app.jar ${JAVA_OPTS_SUFFIX}"]
