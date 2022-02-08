FROM asia-southeast1-docker.pkg.dev/rational-terra-336303/ping-pong-docker-repo/tomcat-maven-img:latest
WORKDIR /app/
COPY pom.xml .
COPY src/ src
USER root
RUN mvn -f /app/pom.xml clean package
RUN mv /app/target/ping_pong-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
RUN chown -R tomcat:tomcat /usr/local/tomcat
RUN chmod -R 777 /usr/local/tomcat
USER tomcat
ENTRYPOINT ["/usr/local/tomcat/bin/catalina.sh", "run"]
