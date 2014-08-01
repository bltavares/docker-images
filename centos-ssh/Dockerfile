FROM centos

MAINTAINER Bruno Tavares <@bltavares>

RUN yum update -y
RUN yum install -y openssh-server which
RUN mkdir -p /var/run/sshd && \
    echo "root:root" | chpasswd
ADD init-functions /etc/rc.d/init.d/functions
RUN /usr/sbin/sshd-keygen
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config
CMD /usr/sbin/sshd -D

EXPOSE 22
