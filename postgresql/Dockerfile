FROM postgres:15

RUN \
    --mount=type=cache,target=/var/cache/apt \
    apt-get update && apt-get install -y dumb-init

ENTRYPOINT ["/usr/bin/dumb-init", "--", "docker-entrypoint.sh"]
CMD ["postgres"]