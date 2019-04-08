#!/bin/sh
set -e

apk add --no-cache curl unzip

case "$TARGET_ARCH" in
    arm32v5)
        url=https://github.com/bltavares/nomad-arm6l/releases/download/v${NOMAD_VERSION}-armv6l/nomad-armv6l.zip
        ;;
    arm32v7)
        url=https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_arm.zip
        ;;
    amd64)
        url=https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip
        ;;
    arm64v8)
        url=https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_arm64.zip
        ;;
    *)
        echo "Unsupported target arch: $TARGET_ARCH"
        exit 1
        ;;
esac

curl -sLo nomad.zip "$url"
unzip nomad.zip >/dev/null
chmod +x nomad
mv nomad /usr/local/bin/nomad
