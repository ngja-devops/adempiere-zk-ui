# adempiere-zk-ui

<p align="center">
  <a href="https://adoptium.net/es/temurin/releases/?version=11">
    <img src="https://badgen.net/badge/Java/11/orange" alt="Java">
  </a>
  <a href="https://github.com/adempiere/adempiere-zk-ui/actions/workflows/build.yml">
    <img src="https://github.com/adempiere/adempiere-zk-ui/actions/workflows/build.yml/badge.svg" alt="Build GH Action">
  </a>
  <a href="https://github.com/adempiere/adempiere-zk-ui/blob/master/LICENSE">
    <img src="https://img.shields.io/badge/license-GNU/GPL%20(v2)-blue" alt="License">
  </a>
  <a href="https://github.com/adempiere/adempiere-zk-ui/releases/latest">
    <img src="https://img.shields.io/github/release/adempiere/adempiere-zk-ui.svg" alt="GitHub release">
  </a>
  <a href="https://discord.gg/T6eH6A7PJZ">
    <img src="https://badgen.net/badge/discord/join%20chat" alt="Discord">
  </a>
</p>

A swing User Interface based in adempiere box

This project just treat of run ADempiere ZK UI based on base adempiere box project using gradle

## Requirements

This project is a java client using swing interface and completely based on gradle package management

The follow requirements need for run it:

- [Java 11 or higher](https://adoptopenjdk.net/)
- [Gradle](https://gradle.org/install/)

## Runing as development
### Clean
```shell
gradle clean
```

### Execute ZK-UI with jetty lugin
With default connection properties file (`$HOME/Adempiere.properties`)
```shell
gradle appRun
```

```shell
# As System Property
gradle appRun -DPropertyFile=/tmp/TEMPLATE.properties
```


## Generate war file

You can generate a war file using the follow command

```shell
# As System Property
gradle war
```

This will be generated in `adempiere-zk-ui/build/libs/adempiere-zk-ui.war`


With custom connection properties file

Note that the java/AdempiereDS is missing


```Shell
14:50:29 WARN  Failed startup of context o.a.g.JettyWebAppContext@a567e72{ADempiere WebUI,/adempiere-zk-ui,file:///opt/Development/workspace-jdk-11/adempiere-zk-ui/build/inplaceWebapp/,UNAVAILABLE}
java.lang.reflect.InvocationTargetException: null
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
        at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.base/java.lang.reflect.Method.invoke(Method.java:566)
        at org.eclipse.jetty.webapp.IterativeDescriptorProcessor.visit(IterativeDescriptorProcessor.java:81)
        at org.eclipse.jetty.webapp.IterativeDescriptorProcessor.process(IterativeDescriptorProcessor.java:69)
        at org.eclipse.jetty.webapp.MetaData.resolve(MetaData.java:484)
        at org.eclipse.jetty.webapp.WebAppContext.startContext(WebAppContext.java:1304)
        at org.eclipse.jetty.server.handler.ContextHandler.doStart(ContextHandler.java:896)
        at org.eclipse.jetty.servlet.ServletContextHandler.doStart(ServletContextHandler.java:306)
        at org.eclipse.jetty.webapp.WebAppContext.doStart(WebAppContext.java:533)
        at org.akhikhl.gretty.JettyWebAppContext.super$10$doStart(JettyWebAppContext.groovy)
        at org.akhikhl.gretty.JettyWebAppContext$_doStart_closure2.doCall(JettyWebAppContext.groovy:47)
        at org.akhikhl.gretty.JettyWebAppContext$_doStart_closure2.doCall(JettyWebAppContext.groovy)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
        at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.base/java.lang.reflect.Method.invoke(Method.java:566)
        at org.codehaus.groovy.reflection.CachedMethod.invoke(CachedMethod.java:107)
        at groovy.lang.MetaMethod.doMethodInvoke(MetaMethod.java:323)
        at org.codehaus.groovy.runtime.metaclass.ClosureMetaClass.invokeMethod(ClosureMetaClass.java:274)
        at groovy.lang.MetaClassImpl.invokeMethod(MetaClassImpl.java:1035)
        at groovy.lang.Closure.call(Closure.java:412)
        at org.codehaus.groovy.runtime.ConvertedClosure.invokeCustom(ConvertedClosure.java:50)
        at org.codehaus.groovy.runtime.ConversionHandler.invoke(ConversionHandler.java:112)
        at com.sun.proxy.$Proxy13.run(Unknown Source)
        at org.eclipse.jetty.webapp.WebAppClassLoader.runWithServerClassAccess(WebAppClassLoader.java:134)
        at org.akhikhl.gretty.JettyWebAppContext.doStart(JettyWebAppContext.groovy:46)
        at org.eclipse.jetty.util.component.AbstractLifeCycle.start(AbstractLifeCycle.java:93)
        at org.eclipse.jetty.util.component.LifeCycle$start$0.call(Unknown Source)
        at org.codehaus.groovy.runtime.callsite.CallSiteArray.defaultCall(CallSiteArray.java:47)
        at org.codehaus.groovy.runtime.callsite.AbstractCallSite.call(AbstractCallSite.java:125)
        at org.codehaus.groovy.runtime.callsite.AbstractCallSite.call(AbstractCallSite.java:130)
        at org.akhikhl.gretty.JettyConfigurerImpl.addHandlerToServer(JettyConfigurerImpl.groovy:323)
        at org.akhikhl.gretty.JettyConfigurer$addHandlerToServer$9.call(Unknown Source)
        at org.codehaus.groovy.runtime.callsite.CallSiteArray.defaultCall(CallSiteArray.java:47)
        at org.codehaus.groovy.runtime.callsite.AbstractCallSite.call(AbstractCallSite.java:125)
        at org.codehaus.groovy.runtime.callsite.AbstractCallSite.call(AbstractCallSite.java:148)
        at org.akhikhl.gretty.JettyServerManager.startServer(JettyServerManager.groovy:59)
        at org.akhikhl.gretty.ServerManager$startServer$0.call(Unknown Source)
        at org.codehaus.groovy.runtime.callsite.CallSiteArray.defaultCall(CallSiteArray.java:47)
        at org.codehaus.groovy.runtime.callsite.AbstractCallSite.call(AbstractCallSite.java:125)
        at org.codehaus.groovy.runtime.callsite.AbstractCallSite.call(AbstractCallSite.java:139)
        at org.akhikhl.gretty.Runner.run(Runner.groovy:135)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
        at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.base/java.lang.reflect.Method.invoke(Method.java:566)
        at org.codehaus.groovy.runtime.callsite.PlainObjectMetaMethodSite.doInvoke(PlainObjectMetaMethodSite.java:43)
        at org.codehaus.groovy.runtime.callsite.PogoMetaMethodSite$PogoCachedMethodSiteNoUnwrapNoCoerce.invoke(PogoMetaMethodSite.java:193)
        at org.codehaus.groovy.runtime.callsite.PogoMetaMethodSite.call(PogoMetaMethodSite.java:73)
        at org.codehaus.groovy.runtime.callsite.CallSiteArray.defaultCall(CallSiteArray.java:47)
        at org.codehaus.groovy.runtime.callsite.AbstractCallSite.call(AbstractCallSite.java:125)
        at org.codehaus.groovy.runtime.callsite.AbstractCallSite.call(AbstractCallSite.java:130)
        at org.akhikhl.gretty.Runner.main(Runner.groovy:51)
Caused by: java.lang.IllegalStateException: Nothing to bind for name java/AdempiereDS
        at org.eclipse.jetty.plus.webapp.PlusDescriptorProcessor.bindEntry(PlusDescriptorProcessor.java:892)
        at org.eclipse.jetty.plus.webapp.PlusDescriptorProcessor.bindResourceRef(PlusDescriptorProcessor.java:814)
        at org.eclipse.jetty.plus.webapp.PlusDescriptorProcessor.visitResourceRef(PlusDescriptorProcessor.java:221)
        ... 55 common frames omitted
14:50:29 INFO  Jetty 11.0.11 started and listening on port 8080
14:50:29 INFO  ADempiere WebUI runs at:
14:50:29 INFO    http://localhost:8080/adempiere-zk-ui
```