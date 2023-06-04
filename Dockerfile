FROM gradle:7-jdk17 as build

RUN curl -L https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/standalone > /Geyser.jar

FROM openjdk:17

COPY --from=build /Geyser.jar /opt/Geyser/Geyser.jar

WORKDIR /var/lib/geyser
CMD ["java", "-jar", "/opt/Geyser/Geyser.jar"]
