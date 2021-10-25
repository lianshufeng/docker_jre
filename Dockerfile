#下载jdk
FROM alpine:latest as build
MAINTAINER lianshufeng <251708339@qq.com>

#构建参数 --build-arg
ARG JDK_URL="http://dl.jpy.wang/jdk-11.0.12_linux-x64_bin.tar.gz"
ARG JAVA_HOME="/opt/jdk"


#下载 JDK
RUN wget -O /tmp/jdk.tar.gz --no-check-certificate  $JDK_URL
#解压并设置环境
RUN set -xe \
	&& mkdir /tmp/jdk \
	&& tar -xvzf /tmp/jdk.tar.gz -C /tmp/jdk \
	&& rm -rf /tmp/jdk.tar.gz \
	&& mkdir -p $JAVA_HOME \
	&& rm -rf $JAVA_HOME \
	&& mv /tmp/jdk/$(ls /tmp/jdk/) $JAVA_HOME \
	&& rm -rf /tmp/jdk \
	&& chmod -R 777 $JAVA_HOME 


#默认的启动命令
ENV ENTRYPOINT=""

#创建启动脚本
RUN set -xe \
	#引导程序
	&& echo "#!/bin/bash" > /opt/bootstrap.sh \
	&& echo "source /etc/profile" >> /opt/bootstrap.sh \
	&& echo "export LANG=en_US.UTF-8" >> /opt/bootstrap.sh \
	&& echo "echo \${ENTRYPOINT}|awk '{run=\$0;system(run)}'" >> /opt/bootstrap.sh 




#启动项
ENTRYPOINT  sh /opt/bootstrap.sh 



	





