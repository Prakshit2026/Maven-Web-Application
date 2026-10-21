from maven:3.6.1-jdk-8-alpine
workdir /work
copy . .
run mvn clean package


from tomcat:9.0-jdk11
copy --from=0 /work/target/maven-web-application*.war /usr/local/tomcat/webapps/
cmd ["/usr/local/tomcat/bin/catalina.sh", "run"]
expose 8080
