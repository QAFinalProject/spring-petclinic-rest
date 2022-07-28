FROM maven:3.8.4-openjdk-8 AS buildstage

WORKDIR /app

COPY . .

RUN mvn package

FROM openjdk:latest AS runstage

COPY --from=buildstage /app/target/spring-petclinic-rest-2.6.2.jar .

EXPOSE 9966

# RUN groupadd spring
# RUN adduser --system --groups spring

# USER spring

ENTRYPOINT ["java", "-jar", "spring-petclinic-rest-2.6.2.jar"]