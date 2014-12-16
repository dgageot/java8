FROM ggtools/busybox-ubuntu
MAINTAINER Christophe Labouisse <christophe@labouisse.org>

# Install jre with tools.jar
RUN (curl -s -k -L -C - https://bintray.com/artifact/download/clabouisse/obuildfactory-generic-x86-64/jdk-1.8.0-openjdk-x86_64-1.8.0_40-b18.tar.bz2 | tar xfj -) \
	&& mv /jdk1.8.0_40/jre /jre1.8.0_40 \
	&& mv /jdk1.8.0_40/lib/tools.jar /jre1.8.0_40/lib/ext \
	&& mv /jdk1.8.0_40/bin/javac /jre1.8.0_40/bin \
	&& rm -Rf /jdk1.8.0_40

ENV JAVA_HOME /jre1.8.0_40
ENV PATH $PATH:$JAVA_HOME/bin

CMD ["java"]
