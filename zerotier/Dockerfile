ARG BUILDER_ARCH=amd64
ARG TARGET_ARCH=amd64

## Supports x86_64, x86, armhf, arm64, ppc64le
FROM ${BUILDER_ARCH}/debian:bookworm as builder
ARG ZEROTIER_VERSION
RUN apt-get update && apt-get install -y curl gnupg
RUN ( \
    apt-key adv --batch --keyserver hkp://keyserver.ubuntu.com --recv-keys 0x1657198823e52a61 || \
    apt-key adv --batch --keyserver hkps://keys.openpgp.org --recv-keys 0x1657198823e52a61 || \
    curl -s https://download.zerotier.com/contact%40zerotier.com.gpg | gpg --dearmor | tee /etc/apt/trusted.gpg.d/zerotier.com.gpg > /dev/null \
    ) && \
    echo "deb https://download.zerotier.com/debian/bookworm bookworm main" > /etc/apt/sources.list.d/zerotier.list
RUN apt-get update && apt-get install -y zerotier-one=${ZEROTIER_VERSION}

FROM ${TARGET_ARCH}/debian:bookworm-slim
ARG ZEROTIER_VERSION
ARG BUILD_DATE

RUN apt-get update && apt-get install -y \
    libssl3 \
    && rm -rf /var/lib/apt/lists/*

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
