FROM bitnami/tomcat:10.0.27
MAINTAINER <alumnos>

ADD *.jar /opt/bitnami/tomcat/lib/
ADD context.xml /opt/bitnami/tomcat/conf/
ADD server.xml /opt/bitnami/tomcat/conf/

ADD ROOT.war /opt/bitnami/tomcat/webapps/
