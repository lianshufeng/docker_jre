# 编译环境
FROM openjdk:11-jdk as build
MAINTAINER lianshufeng <251708339@qq.com>

# jre
RUN jlink --no-header-files --no-man-pages --add-modules java.base,java.logging,java.desktop,java.naming,java.management,java.management.rmi,java.security.jgss,java.instrument,java.prefs,java.xml,java.rmi,java.scripting,java.transaction.xa,java.sql,java.sql.rowset --output /opt/jre


# 运行环境
FROM openjdk:11-jre as runtime
MAINTAINER lianshufeng <251708339@qq.com>
#拷贝运行
COPY --from=build /opt/jre /usr/local/openjdk-11 


