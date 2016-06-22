FROM jenkins
LABEL version="1.0.a"
MAINTAINER Sergii Marynenko <marynenko@gmail.com>

# ENV TERM=xterm JENHOME=/var/jenkins_home JENREF=/usr/share/jenkins/ref
ENV TERM=xterm JENREF=/usr/share/jenkins/ref
USER root
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y htop mc net-tools sudo && \
    echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers && \
    rm -rf /var/lib/apt/lists/*

############################################
# Configure Jenkins
############################################
# Switch to user jenkins
USER jenkins

# Jenkins settings
# COPY config/*.xml ${JENREF}/

# Define plugin set and run it's installation
COPY plugins.txt ${JENKINS_HOME}/plugins.txt
RUN /usr/local/bin/plugins.sh ${JENKINS_HOME}/plugins.txt
