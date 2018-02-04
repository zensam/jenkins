FROM jenkins
# FROM jenkins:2.60.1

# ENV TERM=xterm JENHOME=/var/jenkins_home JENREF=/usr/share/jenkins/ref
ENV TERM=xterm JENREF=/usr/share/jenkins/ref
USER root
RUN apt-get update \
    && apt-get install -y dnsutils build-essential libssl-dev openssl sudo \
    && echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers \
    && rm -rf /var/lib/apt/lists/*

############################################
# Configure Jenkins
############################################
# Switch to user jenkins
USER jenkins
# Jenkins settings
# COPY config/*.xml ${JENREF}/
# Define plugin set and run it's installation
# COPY plugins.txt ${JENKINS_HOME}/plugins.txt
# RUN /usr/local/bin/plugins.sh ${JENKINS_HOME}/plugins.txt
# RUN /usr/local/bin/install-plugins.sh "$(< ${JENKINS_HOME}/plugins.txt)"
RUN /usr/local/bin/install-plugins.sh \
    ansible \
    cloudbees-folder \
    cmakebuilder \
    config-file-provider \
    credentials \
    dashboard-view \
    disk-usage \
#     docker-commons \
#     docker-plugin \
    docker-workflow:1.9.1 \
    ec2 \
    git \
    git-client \
    greenballs \
#     jenkins-multijob-plugin \
    plugin-usage-plugin \
    saferestart \
    sonar \
    ssh-agent \
    thinBackup \
#     ssh-credentials \
    ssh-slaves \
    timestamper \
    workflow-aggregator \
    ws-cleanup
