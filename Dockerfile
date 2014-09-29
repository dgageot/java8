FROM dgageot/busybox-ubuntu
MAINTAINER David Gageot <david@gageot.net>

# Install curl with ssl support
#
RUN (wget -O - http://www.magicermine.com/demos/curl/curl/curl-7.30.0.ermine.tar.bz2 | bunzip2 -c - | tar xf -) \
	&& mv /curl-7.30.0.ermine/curl.ermine /bin/curl \
	&& rm -Rf /curl-7.30.0.ermine

# Install jre with tools.jar
#
RUN (curl -s -k -L -C - -b "oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u20-b26/jdk-8u20-linux-x64.tar.gz | tar xfz -) \
	&& mv /jdk1.8.0_20/jre /jre1.8.0_20 \
	&& mv /jdk1.8.0_20/lib/tools.jar /jre1.8.0_20/lib/ext \
	&& rm -Rf /jdk1.8.0_20

ENV JAVA_HOME /jre1.8.0_20
ENV PATH $PATH:$JAVA_HOME/bin

WORKDIR /home
CMD ["java"]
