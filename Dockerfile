FROM jenkins/jenkins:lts
MAINTAINER sherwood@crunchbase.com

ADD ./archive.zip /archive.zip

# Must be root user in order to create new JENKINS_HOME directory.
USER root

# Unzip the Jenkins archive to the new JENKINS_HOME.
RUN unzip /archive.zip -d /var/new_jenkins_home

ENV JENKINS_HOME /var/new_jenkins_home
ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/jenkins.sh"]

