FROM tomcat:8.0.20-jre8

COPY target/secondProject*.war /opt/tomcat9/webapps/secondProject.war
