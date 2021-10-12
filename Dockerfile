FROM openjdk:17-slim
RUN apt update && apt upgrade -y && apt autoremove -y
COPY ./classes/lib/jrebel.jar /jrebel.jar
COPY ./classes/lib/libjrebel64.so /lib/libjrebel64.so
EXPOSE  8080
WORKDIR /Tools/app
COPY demo*.jar app.jar
ENTRYPOINT ["sh", "-c", "java ${JAVA_OPTS} -jar app.jar ${JAVA_OPTS_SUFFIX}"]
# docker run -it -e JAVA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005 -agentpath:/lib/libjrebel64.so -Drebel.remoting_plugin=true -Drebel.remoting_port=5000" -p 5000:5000 -p 5005:5005 -p 8080:8080 xxx:xxx