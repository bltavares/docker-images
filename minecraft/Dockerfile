FROM alpine:latest AS downloader
RUN apk add --no-cache curl
RUN echo cache-busted-2024-07-12
RUN curl -fLs -o /opt/geyser.jar https://download.geysermc.org/v2/projects/geyser/versions/2.5.1/builds/726/downloads/spigot
RUN curl -fLs -o /opt/floodgate.jar https://download.geysermc.org/v2/projects/floodgate/versions/2.2.3/builds/114/downloads/spigot
RUN curl -fLs -o /opt/lanbroadcaster.jar https://cdn.modrinth.com/data/Y6nlCg58/versions/dqFAYmJE/LanBroadcasterPaper-2.3.1.jar

FROM itzg/minecraft-server:java21
ENV PAPER=1.21.3
ENV TYPE=PAPER
COPY --from=downloader /opt/geyser.jar /plugins/geyser.jar
COPY --from=downloader /opt/floodgate.jar /plugins/floodgate.jar
COPY --from=downloader /opt/lanbroadcaster.jar /plugins/lanbroadcaster.jar