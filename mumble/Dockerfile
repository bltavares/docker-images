FROM alpine:3.1

RUN apk add --update murmur
ADD murmur.ini /etc/murmur.ini
EXPOSE 64738

CMD ["/usr/bin/murmurd", "-fg"]
