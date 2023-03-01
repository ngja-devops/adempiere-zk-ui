FROM tomcat:9.0.72-jdk11-temurin
LABEL manteiner=cparada@erpya.com
	
ENV ADEMPIERE_HOME="/opt/Adempiere" \
	ADEMPIERE_DB_USER="adempiere" \
	ADEMPIERE_DB_PASSWORD="adempiere" \
	ADEMPIERE_JAVA_OPTIONS="-Xms64M -Xmx1512M" \
	ADEMPIERE_DB_TYPE="PostgreSQL" \
	ADEMPIERE_DB_SERVER="localhost" \
	ADEMPIERE_DB_NAME="adempiere" \
	ADEMPIERE_DB_PORT="5432" 

COPY docker/Adempiere.properties $ADEMPIERE_HOME/
COPY docker/tomcat/settings/*.xml $CATALINA_HOME/conf
COPY docker/tomcat/settings/setenv.sh $CATALINA_HOME/bin
COPY build/libs/zk-ui.war $CATALINA_HOME/webapps/webui.war
COPY build/libs/zk-ui.jar $CATALINA_HOME/lib
COPY build/distributions/zk-ui.tar $CATALINA_HOME/lib

RUN cd lib && \
	tar -xvf zk-ui.tar zk-ui/lib --transform='s/.*\///' && \
	rm -R lib zk-ui.tar