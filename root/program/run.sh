#!/bin/sh
curl -Lo /program/speedtest/speedtest https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py
chmod +x /program/speedtest/speedtest
ln -s /program/besttrace/besttrace /bin/besttrace
ln -s /program/speedtest/speedtest /bin/speedtest
ln -s /program/menu /bin/menu
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
yum -y install epel-release \
yum clean all && yum makecache
yum -y install \
       tcpdump \
       perf \
       blktrace \
       btrfs-progs \
       ethtool \
       file \
       findutils \
       git \
       hwloc \
       iotop \
       iproute \
       iputils \
       less \
       pciutils \
       ltrace \
       man-db \
       nc \
       netsniff-ng \
       net-tools \
       passwd \
       procps-ng \
       screen \
       strace \
       which \
       ostree \
       vim-minimal \
       bash-completion \
       rootfiles \
       yum-utils \
       nmap \
       wget \
       aria2 \
       mtr \
       qperf \
       iperf3 \
       bind-utils \
       fping \
       iftop \
       crontabs \
       rsyslog \
       iptraf-ng \
       rsync \
       vsftpd \
       httpd \
       smb \
       samba \
       samba-client \
       nfs-utils \
       cifs-utils \
       && yum clean all
