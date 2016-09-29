FROM sshd:ubuntu
#设置继承自镜像
MAINTAINER neednotoknown from watchworld@github.com
#设置环境变量,所有操作都是非交互式的
ENV DEBIAN_FRONTEND noninteractive
#安装

RUN echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata
#修改时区,默认会产生随机性

#安装跟tomcat用户认证相关的软件
RUN apt-get install -yq --no-install-recommends wget pwgen ca-certificates && apt-get clean && rm -rf /var/lib/apt/lists/*

#设置环境变量
ENV CATALINA_HOME /tomcat
ENV JAVA_HOME /jdk

ADD apache-tomcat-8.0.36 /tomcat
ADD jdk1.8.0_101 /jdk

ADD create_tomcat_admin_user.sh /create_tomcat_admin_user.sh
ADD run.sh /run.sh
RUN chmod +x /*.sh
RUN chmod +x /tomcat/bin/*.sh

EXPOSE 8080

CMD ["/run.sh"]
