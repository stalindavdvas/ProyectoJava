# Usamos una imagen de Maven para construir el proyecto
FROM maven:3.8.4-openjdk-17 AS build

WORKDIR /app

# Copiamos el archivo POM y el código fuente
COPY pom.xml .
COPY src ./src

# Construimos el proyecto
RUN mvn clean package -DskipTests

# Usamos una imagen ligera de Java para ejecutar la aplicación
FROM openjdk:17-jdk-slim

WORKDIR /app

# Copiamos el JAR construido al contenedor
COPY --from=build /app/target/proyectojava-0.0.1-SNAPSHOT.jar app.jar

# Exponemos el puerto 8080
EXPOSE 8080

# Ejecutamos la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]
