FROM frolvlad/alpine-java:jdk8-slim  AS build
WORKDIR /app/springbootapp/

## copy maven project
COPY . .
RUN chmod +x mvnw 
RUN ls
RUN mvnw clean package

## Runtime
FROM frolvlad/alpine-java:jre8-slim AS runtime
WORKDIR /app
COPY --from=build /app/springbootapp/target/*.jar ./
EXPOSE 8081
ENTRYPOINT ["java", "-jar", "*.jar"]
