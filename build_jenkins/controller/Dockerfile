FROM jenkins/jenkins:2.343-jdk11
USER root
RUN apt-get update && apt-get install -y lsb-release
RUN apt-get install git -y
USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean:1.25.3 docker:1.2.8:https://updates.jenkins.io/download/plugins/docker-plugin/1.2.8/docker-plugin.hpi"
