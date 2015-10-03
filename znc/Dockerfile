FROM alpine:3.2

MAINTAINER Bruno Tavares <@bltavares>

RUN apk add --update znc openssl-dev ca-certificates && rm -rf /var/cache/apk/*

USER znc
CMD ["znc", "--foreground", "--datadir", "/znc"]
