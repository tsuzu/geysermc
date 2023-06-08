FROM gradle:7-jdk17 as build

RUN curl -L https://ci.opencollab.dev/job/GeyserMC/job/Geyser/job/master/lastSuccessfulBuild/artifact/bootstrap/standalone/build/libs/Geyser-Standalone.jar > /Geyser.jar

FROM openjdk:17

COPY --from=build /Geyser.jar /opt/Geyser/Geyser.jar

WORKDIR /var/lib/geyser
CMD ["java", "-jar", "/opt/Geyser/Geyser.jar"]
