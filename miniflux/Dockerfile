FROM miniflux/miniflux:latest

USER root
RUN apk add --no-cache dumb-init

USER nobody
ENTRYPOINT ["/usr/bin/dumb-init", "--", "miniflux"]