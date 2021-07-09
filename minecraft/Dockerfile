FROM alpine:latest as downloader
RUN apk add --no-cache curl
RUN echo cache-busted-2021-07-09
RUN curl -fLs -o /opt/geyser.jar https://ci.opencollab.dev//job/GeyserMC/job/Geyser/job/master/lastSuccessfulBuild/artifact/bootstrap/spigot/target/Geyser-Spigot.jar
RUN curl -fLs -o /opt/floodgate.jar https://ci.opencollab.dev/job/GeyserMC/job/Floodgate/job/master/lastSuccessfulBuild/artifact/spigot/target/floodgate-spigot.jar
RUN curl -fLs -o /opt/lanbroadcaster.jar https://gitlab.com/ruany/LANBroadcaster/uploads/dea1a2c04ea4d2463c432b0bf60321a6/LANBroadcaster.jar

FROM itzg/minecraft-server:java16
ENV PAPER=1.17.1
ENV TYPE=PAPER
COPY --from=downloader /opt/geyser.jar /plugins/geyser.jar
COPY --from=downloader /opt/floodgate.jar /plugins/floodgate.jar
COPY --from=downloader /opt/lanbroadcaster.jar /plugins/lanbroadcaster.jar