FROM jprjr/arch

MAINTAINER Bruno Tavares <@bltavares>

RUN pacman -Sy --noconfirm
RUN pacman -S  --noconfirm openssh which tar curl grep
RUN mkdir -p /var/run/sshd && \
    echo "root:root" | chpasswd
RUN /usr/bin/ssh-keygen -A
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config
CMD /usr/sbin/sshd -D

EXPOSE 22
