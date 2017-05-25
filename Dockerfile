FROM dgageot/busybox-ubuntu
MAINTAINER David Gageot <david@gageot.net>

# Install curl with ssl support
#
RUN (wget -O - http://www.magicermine.com/demos/curl/curl/curl-7.30.0.ermine.tar.bz2 | bunzip2 -c - | tar xf -) \
	&& mv /curl-7.30.0.ermine/curl.ermine /bin/curl \
	&& rm -Rf /curl-7.30.0.ermine \
	\
# Install jre \
	&& (curl -k -L -C - -b "oraclelicense=accept-securebackup-cookie" \
	http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jre-8u131-linux-x64.tar.gz \
	| tar xfz -)

ENV JAVA_HOME /jre1.8.0_131
ENV PATH $PATH:$JAVA_HOME/bin

WORKDIR /home
CMD ["java"]
