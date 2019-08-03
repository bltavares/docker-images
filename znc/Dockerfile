FROM alpine:3.10 as builder

WORKDIR /var/znc
RUN apk add --no-cache znc-dev openssl-dev ca-certificates curl icu-dev zlib-dev build-base \
    && curl https://raw.githubusercontent.com/jreese/znc-push/master/push.cpp > push.cpp \
    && znc-buildmod push.cpp \
    && rm push.cpp

FROM alpine:3.10

RUN apk add --no-cache znc openssl-dev ca-certificates
COPY --from=builder /var/znc/push.so /usr/lib/znc/push.so

USER znc
CMD ["znc", "--foreground", "--datadir", "/znc"]

EXPOSE 6697