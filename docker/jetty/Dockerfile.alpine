FROM jetty:10.0.11-jdk11-alpine
LABEL manteiner=cparada@erpya.com
	
ENV ADEMPIERE_HOME="/opt/Adempiere" \
	ADEMPIERE_DB_USER="adempiere" \
	ADEMPIERE_DB_PASSWORD="adempiere" \
	ADEMPIERE_JAVA_OPTIONS="-Xms64M -Xmx1512M" \
	ADEMPIERE_DB_TYPE="PostgreSQL" \
	ADEMPIERE_DB_SERVER="localhost" \
	ADEMPIERE_DB_NAME="adempiere" \
	ADEMPIERE_DB_PORT="5432" \
	ADEMPIERE_APPS_TYPE="jetty"

COPY --chown=jetty:jetty docker/AdempiereTemplate.properties $ADEMPIERE_HOME/Adempiere.properties
COPY --chown=jetty:jetty docker/jetty/settings/jetty-ds.xml $JETTY_BASE
COPY --chown=jetty:jetty docker/jetty/settings/adempiere.sh $JETTY_BASE/bin/
COPY --chown=jetty:jetty build/libs/zk-ui.war $JETTY_BASE/webapps/webui.war
COPY --chown=jetty:jetty build/libs/zk-ui.jar $JETTY_BASE/lib/ext
COPY --chown=jetty:jetty build/distributions/zk-ui.zip $JETTY_BASE/lib/ext

RUN	unzip $JETTY_BASE/lib/ext/zk-ui.zip -j -o -d $JETTY_BASE/lib/ext/ && \
	rm -R $JETTY_BASE/lib/ext/javaee-api* $JETTY_BASE/lib/ext/zk-ui.zip && \
	chmod +x $JETTY_BASE/bin/adempiere.sh  && \
	/generate-jetty-start.sh
	
ENTRYPOINT ["bin/adempiere.sh"]