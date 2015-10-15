FROM alpine:3.2

MAINTAINER Bruno Tavares <@bltavares>

RUN apk add --update bitlbee openssl-dev ca-certificates && rm -rf /var/cache/apk/*
RUN adduser -Ds /bin/sh bitlbee

USER bitlbee
CMD ["bitlbee", "-u", "bitlbee", "-n", "-p", "6667", "-d", "/bitlbee"]
