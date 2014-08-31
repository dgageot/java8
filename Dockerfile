FROM dgageot/busybox-ubuntu
MAINTAINER David Gageot <david@gageot.net>

# Update dependencies
RUN (wget -O - http://www.magicermine.com/demos/curl/curl/curl-7.30.0.ermine.tar.bz2 | bunzip2 -c - | tar xf -) \
	&& (./curl-7.30.0.ermine/curl.ermine -s -k -L -C - -b "oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u20-b26/jdk-8u20-linux-x64.tar.gz | tar xfz -) \
	&& rm -Rf curl-7.30.0.ermine \
	&& mv /jdk1.8.0_20/jre /jre1.8.0_20 \
	&& rm -Rf /jdk1.8.0_20

ENV JAVA_HOME /jre1.8.0_20
ENV PATH $PATH:$JAVA_HOME/bin

WORKDIR /home
CMD ["java"]
