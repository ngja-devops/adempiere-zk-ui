#!/bin/sh
# ADempiere Server Start

if [ $ADEMPIERE_HOME ]; then
  cd $ADEMPIERE_HOME/utils
fi

. ./myEnvironment.sh Server

# To use your own Encryption class (implementing org.compiere.util.SecureInterface),
# you need to set it here (and in the client start script) - example:
# SECURE=-DADEMPIERE_SECURE=org.compiere.util.Secure
SECURE=

# headless option if you don't have X installed on the server
JAVA_OPTS="-server $ADEMPIERE_JAVA_OPTIONS $SECURE -Djava.awt.headless=true -Dorg.adempiere.server.embedded=true --add-exports java.base/jdk.internal.misc=ALL-UNNAMED --add-opens java.base/java.lang=ALL-UNNAMED"

export JAVA_OPTS

if [ $ADEMPIERE_APPS_TYPE = "wildfly" ]
then
  if test -f "$WILDFLY_HOME/wildfly.pid"
    then
      echo "ADempiere's Server is already running .."
    else
      export JBOSS_HOME=
      export WILDFLY_BASE=$ADEMPIERE_HOME/wildfly
      echo "ADempiere Server $ADEMPIERE_APPS_TYPE starting ..."
      if test -f "$WILDFLY_HOME/login-modules.configured"
        then
          echo "-> Login modules were configured before"
        else
          echo "-> Adding Login modules"
              nohup $WILDFLY_HOME/bin/standalone.sh --admin-only -Djboss.server.base.dir=$WILDFLY_BASE/standalone -Djboss.http.port=$ADEMPIERE_WEB_PORT -Djboss.https.port=$ADEMPIERE_SSL_PORT -Djboss.bind.address=0.0.0.0 >./nohup.out 2>./nohup.err &
              sleep 7
              sh $WILDFLY_HOME/bin/jboss-cli.sh --connect command="/subsystem=security/security-domain=custom-security-realm:add"
              sh $WILDFLY_HOME/bin/jboss-cli.sh --connect command="/subsystem=security/security-domain=custom-security-realm/authentication=classic:add(login-modules=[{"code" => "org.adempiere.as.jboss.AdempiereLoginModule", "flag" => "required", "module-options"=[ ("junauthenticatedIdentity"=>"anonymous")]}])"
              sh $WILDFLY_HOME/bin/jboss-cli.sh --connect command=:shutdown
              echo "configured" > $WILDFLY_HOME/login-modules.configured
          echo "-> Added Login modules"    
      fi    
    echo "-> WildFly Starting the Service"  
    nohup $WILDFLY_HOME/bin/standalone.sh --start-mode normal -Djboss.server.base.dir=$WILDFLY_BASE/standalone -Djboss.http.port=$ADEMPIERE_WEB_PORT -Djboss.https.port=$ADEMPIERE_SSL_PORT -Djboss.bind.address=0.0.0.0 >./nohup.out 2>./nohup.err &
    echo $! > $WILDFLY_HOME/wildfly.pid
  fi
fi

if [ $ADEMPIERE_APPS_TYPE = "tomcat" ]
then
  if test -f "$TOMCAT_HOME/tomcat.pid"
    then
      echo "ADempiere's Server is already running .."
    else
      echo "ADempiere Server $ADEMPIERE_APPS_TYPE starting ..."
      $TOMCAT_HOME/bin/startup.sh
      echo $! > $TOMCAT_HOME/tomcat.pid
   fi
fi

if [ $ADEMPIERE_APPS_TYPE = "jetty" ]
then
    if test -z  "$JETTY_HOME"
      then
        echo "JETTY_HOME not defined"
      else
        if test -f "$JETTY_BASE/jetty.pid"
        then
          echo "ADempiere's Server is already running ..."
        else
          echo "ADempiere Server $ADEMPIERE_APPS_TYPE starting ..."
          export JETTY_BASE=$ADEMPIERE_HOME/jetty
          echo "Jetty Home directory : ${JETTY_HOME}"
          echo "Jetty Base directory : ${JETTY_BASE}"
          nohup $JAVA_HOME/bin/java $JAVA_OPTS -jar $JETTY_HOME/start.jar jetty.base=$ADEMPIERE_HOME/jetty --create-start-d --add-modules=server,ext,deploy,jndi,jsp,http jetty.http.port=$ADEMPIERE_WEB_PORT jetty.server.stopAtShutdown=true $JETTY_BASE/jetty-ds.xml >./nohup.out 2>./nohup.err &
          nohup $JAVA_HOME/bin/java $JAVA_OPTS -jar $JETTY_HOME/start.jar jetty.base=$ADEMPIERE_HOME/jetty $JETTY_BASE/jetty-ds.xml >./nohup.out 2>./nohup.err &
          echo $! > $JETTY_BASE/jetty.pid
        fi
    fi
fi
