FROM sshd:ubuntu
#设置继承自镜像
MAINTAINER waitfish from watchworld@github.com
#设置环境变量,所有操作都是非交互式的
ENV DEBIAN_FRONTEND noninteractive
#安装

RUN apt-get -yq install apache2 && rm -rf /var/lib/apt/lists/*
RUN echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata
#修改时区,默认会产生随机性

#添加脚步,设置权限
ADD run.sh /run.sh
RUN chmod 755 /*.sh

#添加web站点
RUN mkdir -p /var/lock/apache2 && mkdir -p /app && rm -fr /var/www/html && ln -s /app /var/www/html
COPY sample/ /app

#设置apcahe相关变量
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_SERVERADMIN admin@localhost
ENV APACHE_SERVERNAME localhost
ENV APACHE_SERVERALIAS docker.localhost
ENV APACHE_DOCUMENTROOT /var/www

EXPOSE 80
WORKDIR /app
CMD ["/run.sh"]

#sudo docker run -i -d -p 80:80 -p 103:22 -e APACHE_SERVERNAME=test -v 'pwd' /www:/var/www:ro apache:ubuntu
