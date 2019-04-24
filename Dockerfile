FROM frolvlad/alpine-java:jdk8-slim  AS build
WORKDIR /app

## copy maven project
COPY .mvn/wrapper mvnw pom.xml src/*.* ./springbootapp/
WORKDIR /app/springbootapp/
RUN mvn clean package

## Runtime console app
FROM frolvlad/alpine-java:jre8-slim AS runtime

WORKDIR /app
COPY --from=build /app/springbootapp/target ./
ENTRYPOINT ["java", "-jar", "*.jar"]