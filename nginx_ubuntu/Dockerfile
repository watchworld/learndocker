#设置继承镜像
FROM sshd:ubuntu
MAINTAINER waitfish from watchworld@github.com
#安装nginx,设置nginx以非daemon启动
RUN apt-get install -y nginx && rm -rf /var/lib/apt/lists/* && echo "\ndaemon off;" >> /etc/nginx/nginx.conf && chown -R www-data:www-data /var/lib/nginx
RUN echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

#添加脚步,权限
ADD run.sh /run.sh
RUN chmod 755 /*.sh

#定义挂载目录,分别是挂载目录,证书目录,配置目录和日志目录
VOLUME ["/etc/nginx/sites-enabled","/etc/nginx/certs","/etc/nginx/conf.d","/var/log/nginx"

#定义工作目录
WORKDIR /etc/nginx

#定义输出命令
CMD ["/run.sh"]]

#定义输出命令
EXPOSE 80
EXPOSE 443

