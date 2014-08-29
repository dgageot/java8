FROM google/debian:wheezy
MAINTAINER David Gageot <david@gageot.net>

# Update dependencies
RUN apt-get update -qq

# Install dependencies
RUN apt-get install -yqq wget

RUN wget -q -O - --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u5-b13/jdk-8u5-linux-x64.tar.gz | tar xzf - -C /opt/

ENV JAVA_HOME /opt/jdk1.8.0_05
ENV PATH $PATH:$JAVA_HOME/bin

WORKDIR /home
CMD ["java"]