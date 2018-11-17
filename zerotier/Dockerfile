ARG BUILDER_ARCH=amd64 
ARG TARGET_ARCH=amd64

## Supports x86_64, x86, armhf, arm64, ppc64le
FROM ${BUILDER_ARCH}/debian:stretch as builder
ARG ZEROTIER_VERSION
RUN apt-get update && apt-get install -y curl gnupg
RUN ( \
    apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 0x1657198823e52a61 || \
    apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 0x1657198823e52a61 || \
    apt-key adv --keyserver hkp://keyserver.pgp.com:80 --recv-keys 0x1657198823e52a61 \
    apt-key adv --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-keys 0x1657198823e52a61 \
    ) && \
    echo "deb http://download.zerotier.com/debian/stretch stretch main" > /etc/apt/sources.list.d/zerotier.list
RUN apt-get update && apt-get install -y zerotier-one=${ZEROTIER_VERSION}

FROM ${TARGET_ARCH}/alpine:latest
MAINTAINER Adam Ierymenko <adam.ierymenko@zerotier.com>

LABEL version="${ZEROTIER_VERSION}"
LABEL description="Containerized ZeroTier One for use on CoreOS or other Docker-only Linux hosts."

# Uncomment to build in container
#RUN apk add --update alpine-sdk linux-headers

RUN apk add --update libgcc libstdc++

RUN mkdir -p /var/lib/zerotier-one

COPY --from=builder /var/lib/zerotier-one/zerotier-cli /usr/sbin/zerotier-cli
COPY --from=builder /var/lib/zerotier-one/zerotier-idtool /usr/sbin/zerotier-idtool
COPY --from=builder /usr/sbin/zerotier-one /usr/sbin/zerotier-one

ENTRYPOINT ["/usr/sbin/zerotier-one"]
