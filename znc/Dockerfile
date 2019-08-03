FROM alpine:3.10

RUN apk add --no-cache znc openssl-dev ca-certificates

USER znc
CMD ["znc", "--foreground", "--datadir", "/znc"]

EXPOSE 6697