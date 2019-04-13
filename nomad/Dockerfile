ARG BUILDER_ARCH=amd64
ARG TARGET_ARCH=amd64

## Supports x86_64, x86, armhf, armel, arm64, ppc64le
FROM ${BUILDER_ARCH}/alpine:3.9 as builder
ARG TARGET_ARCH=amd64
ARG NOMAD_VERSION="0.9.0"
ARG BUILD_DATE

COPY install.sh /install.sh
RUN sh /install.sh

FROM ${TARGET_ARCH}/debian:9
ARG NOMAD_VERSION
ARG BUILD_DATE
LABEL version="${NOMAD_VERSION}" \
  description="Containerized Nomad to be used as server only" \
  org.label-schema.schema-version="1.0" \
  org.label-schema.name="nomad" \
  org.label-schema.description="Containerized Nomad to be used as server only" \
  org.label-schema.build-date="${BUILD_DATE}" \
  org.label-schema.url="https://nomadproject.io" \
  org.label-schema.version="{$NOMAD_VERSION}"

VOLUME /opt/nomad
COPY --from=builder /usr/local/bin/nomad /usr/local/bin/nomad
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
