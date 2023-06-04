FROM gradle:7-jdk17 as build

RUN curl -L https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/standalone > /Geyser.jar

FROM adoptopenjdk/openjdk11:alpine-jre

COPY --from=build /Geyser.jar /opt/Geyser/Geyser.jar

ARG UID=1000
ARG GID=1000
RUN adduser --system --shell /bin/false -u $UID -g $GID --home /opt/Geyser geyser

RUN mkdir -v /var/lib/geyser && chown -v -R ${UID}:0 /var/lib/geyser
VOLUME /var/lib/geyser

USER geyser
WORKDIR /var/lib/geyser
EXPOSE 19132/udp
CMD ["java", "-jar", "/opt/Geyser/Geyser.jar"]
