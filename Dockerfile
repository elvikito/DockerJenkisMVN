FROM jenkins/jenkins:lts-alpine

MAINTAINER elvikito

ENV DEBIAN_FRONTEND noninteractive

ENV maven_version 3.3.9
ENV MAVEN_HOME /opt/maven

USER root
RUN apk update
RUN apk add wget curl openssh-server nano sudo

RUN echo "alias nano='export TERM=xterm && nano'" >> /root/.bashrc

RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers


ARG maven_filename="apache-maven-${maven_version}-bin.tar.gz"
ARG maven_filemd5="516923b3955b6035ba6b0a5b031fbd8b"
ARG maven_url="http://archive.apache.org/dist/maven/maven-3/${maven_version}/binaries/${maven_filename}"
ARG maven_tmp="/tmp/${maven_filename}"

RUN wget --no-verbose -O ${maven_tmp}  ${maven_url}
RUN echo "${maven_filemd5} ${maven_tmp}" | md5sum -c

# install maven
RUN tar xzf ${maven_tmp}  -C /opt/ \
        && ln -s /opt/apache-maven-${maven_version} ${MAVEN_HOME} \
        && ln -s ${MAVEN_HOME}/bin/mvn /usr/local/bin

ENV PATH ${MAVEN_HOME}/bin:$PATH

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/man/?? /usr/share/man/??_*

USER jenkins

RUN echo "alias nano='export TERM=xterm && nano'" >> ${JENKINS_HOME}/.bash_aliases

RUN mvn --version
