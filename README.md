# Lightweight Java images for Docker

The official [Docker image for java 8](https://registry.hub.docker.com/_/java/) are based on Debian which results in rather large images (more than 300MB for the JRE or almost 600MB for the JDK) compared to the JDK size (approximatly 150MB).

This is a fork from [David's Java 8](https://github.com/dgageot/java8) image using my OpenJDK distribution on [Bintray](https://bintray.com/clabouisse/obuildfactory-generic-x86-64/jdk-1.8.0-openjdk-x86_64/) aiming at creating a lightweight Docker image to run Java applications.

## Features

- Based on busybox
- Contains an *boosted* JRE including `tools.jar` and `javac`
- Include extra commands:
  - *[curl](http://curl.haxx.se/)* with ssl support
  - *[gosu](https://github.com/tianon/gosu)* to drop privileges when starting an application
