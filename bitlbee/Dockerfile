FROM debian:jessie

MAINTAINER Bruno Tavares <@bltavares>

COPY bitlbee-facebook.gpg /bitlbee-facebook.gpg
COPY bitlbee.gpg /bitlbee.gpg

RUN echo "deb http://code.bitlbee.org/debian/devel/jessie/amd64/ ./" > /etc/apt/sources.list.d/bitlbee.list && \
    apt-key add /bitlbee.gpg && \
    echo "deb http://download.opensuse.org/repositories/home:/jgeboski/Debian_8.0 ./" > /etc/apt/sources.list.d/jgeboski.list && \
    apt-key add /bitlbee-facebook.gpg && \
    apt-get update -y && \
    apt-get install -y bitlbee bitlbee-facebook bitlbee-plugin-otr ca-certificates

ADD bitlbee.conf /etc/bitlbee/bitlbee.conf
ADD start.sh /home/bitlbee/start.sh

VOLUME "/bitlbee"
EXPOSE 6667
ENV BITLBEE_DEBUG=1
CMD ["/home/bitlbee/start.sh"]
