FROM centos:centos7
 
# OpenSSH サーバをインストールする
RUN yum -y install openssh-server firewalld selinux-policy-targeted setools
 
# root でログインできるようにする
RUN sed -ri 's/^#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config
 
# root のパスワードを 設定
RUN echo 'root:a' | chpasswd
 
# 使わないにしてもここに公開鍵を登録しておかないとログインできない
RUN ssh-keygen -t rsa -N "" -f /etc/ssh/ssh_host_rsa_key
 
# sshd の使うポートを公開する
EXPOSE 22
 
# systemctlを使えるようにする
CMD ["/sbin/init"]
