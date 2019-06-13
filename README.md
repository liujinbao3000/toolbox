[toc]
### 守护进程
1. 部署容器
   ```
   docker run -itd \
     --privileged=true \
     --name=toolbox \
     --net=host \
     -v /etc/localtime:/etc/localtime \
     -v toolbox-conf:/conf \
   liujinbao3000/toolbox /usr/sbin/init
   ```
1. 进入容器并启动，控制菜单
   ```
   docker exec -it toolbox /bin/bash
   menu
   有httpd,aria2,crond,vsftpd,samba,nfs-server
   ```
### 应用程序
#### iperf
##### iperf-server
1. iperf-server 停止后删除
   ```
   docker run -it --rm \
     --name=iperf-server \
     --net=host \
     -v /etc/localtime:/etc/localtime \
   liujinbao3000/toolbox iperf3 -s
   ```
###### iperf-client
1. iperf-client
   ```
   docker run -it --rm \
     --name=iperf-client \
     --net=host \
     -v /iperf3:/data \
     -v /etc/localtime:/etc/localtime \
   liujinbao3000/toolbox iperf3 -c 127.0.0.1 -R -f M -t 10 >> ./iperf3.$(date "+%Y-%m-%d_%H:%M")
   ```
2. 选项解释
   选项|解释
   -|-
   --rm|容器停止后删除
   --name|容器名字
   --net|网络模式：本机
   -v|映射宿主和容器的文件或目录，格式`宿主:容器`；例子中一个保存数据的目录，一个是时区和宿主机同步
   Iperf3|
   -c|客户端模式，连接到服务端（地址）
   -R|客户端下载，默认是客户端上传
   -f|表示显示单位，可以是`kmgtKMGT`
   -t|表示时间，默认是10秒
   >>|将结果保存到当前目录`iperf3.日期_时间`
   --logfile|表示将结果保存保存至文件
#### qperf
1. qperf-server 停止后删除
   ```
   docker run -it --rm \
     --name=qperf-server \
     --net=host \
     -v /etc/localtime:/etc/localtime \
     -v toolbox-conf:/conf \
   liujinbao3000/toolbox qperf
   ```
1. qperf-client
   ```
   docker run -it --rm \
     --name=qperf-client \
     --net=host \
     -v /qperf:/data \
     -v /etc/localtime:/etc/localtime \
   liujinbao3000/toolbox qperf 127.0.0.1 tcp_bw tcp_lat udp_bw udp_lat >> ./qperf.$(date "+%Y-%m-%d_%H:%M")
   ```
