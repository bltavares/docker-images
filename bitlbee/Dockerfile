FROM alpine:3.2

MAINTAINER Bruno Tavares <@bltavares>

RUN apk add --update bitlbee openssl-dev ca-certificates && rm -rf /var/cache/apk/*
RUN adduser -Ds /bin/sh bitlbee

ADD bitlbee.conf /etc/bitlbee/bitlbee.conf

VOLUME "/bitlbee"
EXPOSE 6667

CMD ["bitlbee", "-n", "-v", "-d", "/bitlbee"]
