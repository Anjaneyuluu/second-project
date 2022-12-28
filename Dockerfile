FROM tomcat:8.0.20-jre8

COPY target/secondProject*.war /usr/local/tomcat/webapps/secondProject.war
