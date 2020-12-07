FROM centos/systemd

RUN yum install -y openssh-server openssh-clients; yum clean all; systemctl enable sshd.service
RUN systemctl enable systemd-user-sessions.service
RUN ln -s /usr/lib/systemd/system/systemd-user-sessions.service /etc/systemd/system/default.target.wants/systemd-user-sessions.service
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
