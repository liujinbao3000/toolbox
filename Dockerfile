FROM centos:centos7
MAINTAINER The CentOS Project <cloud-ops@centos.org

ENV container docker
LABEL RUN="docker run -it --name NAME --privileged --ipc=host --net=host --pid=host -e HOST=/host -e NAME=NAME -e IMAGE=IMAGE -v /sys/fs/selinux:/sys/fs/selinux:ro -v /run:/run -v /var/log:/var/log -v /etc/localtime:/etc/localtime -v /:/host IMAGE"
RUN [ -e /etc/yum.conf ] && sed -i '/tsflags=nodocs/d' /etc/yum.conf || true

# Reinstall all packages to get man pages for them

# Swap out the systemd-container package and install all useful packages
# 复制文件到镜像
COPY root/ /
COPY conf/ /
COPY conf/ /conf
#更改工作目录
WORKDIR /program
#运行脚本
RUN /program/run.sh
#设置volume
VOLUME ["/conf"]
#暴露端口
EXPOSE 80 5200 8085 9999/udp 445 873 21
# Set default command
CMD ["/usr/bin/bash"]
