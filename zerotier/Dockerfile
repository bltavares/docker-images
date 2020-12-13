ARG BUILDER_ARCH=amd64
ARG TARGET_ARCH=amd64

## Supports x86_64, x86, armhf, arm64, ppc64le, armle
FROM ${BUILDER_ARCH}/debian:buster as builder
ARG ZEROTIER_VERSION
RUN apt-get update && apt-get install -y curl gnupg
RUN ( \
    apt-key adv --batch --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 0x1657198823e52a61 || \
    apt-key adv --batch --keyserver hkp://pgp.mit.edu:80 --recv-keys 0x1657198823e52a61 || \
    apt-key adv --batch --keyserver hkp://keyserver.pgp.com:80 --recv-keys 0x1657198823e52a61 || \
    apt-key adv --batch --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-keys 0x1657198823e52a61 \
    ) && \
    echo "deb http://download.zerotier.com/debian/buster buster main" > /etc/apt/sources.list.d/zerotier.list
RUN apt-get update && apt-get install -y zerotier-one=${ZEROTIER_VERSION}

FROM ${TARGET_ARCH}/debian:stable-slim
ARG ZEROTIER_VERSION
ARG BUILD_DATE
LABEL version="${ZEROTIER_VERSION}" \
    description="Containerized ZeroTier One for use on CoreOS or other Docker-only Linux hosts." \
    org.label-schema.schema-version="1.0" \
    org.label-schema.name="zerotier" \
    org.label-schema.description="Containerized ZeroTier One for use on CoreOS or other Docker-only Linux hosts." \
    org.label-schema.build-date="${BUILD_DATE}" \
    org.label-schema.url="https://zerotier.com" \
    org.label-schema.version="{$ZEROTIER_VERSION}" \
    org.label-schema.docker.cmd="docker run --device=/dev/net/tun \
    --net=host \
    --cap-add=NET_ADMIN \
    --cap-add=SYS_ADMIN \
    -v /var/lib/zerotier-one:/var/lib/zerotier-one \
    -n zerotier-one \
    -d bltavares/zerotier"

RUN mkdir -p /var/lib/zerotier-one

COPY --from=builder \
    /var/lib/zerotier-one/zerotier-cli \
    /var/lib/zerotier-one/zerotier-idtool \
    /usr/sbin/zerotier-one \
    /usr/sbin/

CMD ["/usr/sbin/zerotier-one"]
