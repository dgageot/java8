FROM dgageot/busybox-ubuntu
MAINTAINER Christophe Labouisse <christophe@labouisse.org>

# Install curl with ssl support
RUN (wget -O - http://www.magicermine.com/demos/curl/curl/curl-7.30.0.ermine.tar.bz2 | bunzip2 -c - | tar xf -) \
	&& mv /curl-7.30.0.ermine/curl.ermine /bin/curl \
	&& rm -Rf /curl-7.30.0.ermine

# Install jre with tools.jar
RUN (curl -s -k -L -C - -b "oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u25-b17/jdk-8u25-linux-x64.tar.gz | tar xfz -) \
	&& mv /jdk1.8.0_25/jre /jre1.8.0_25 \
	&& mv /jdk1.8.0_25/lib/tools.jar /jre1.8.0_25/lib/ext \
	&& mv /jdk1.8.0_25/bin/javac /jre1.8.0_25/bin \
	&& rm -Rf /jdk1.8.0_25

ENV JAVA_HOME /jre1.8.0_25
ENV PATH $PATH:$JAVA_HOME/bin

WORKDIR /home
CMD ["java"]
