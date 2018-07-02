FROM jenkins:latest

# Default user
ENV JENKINS_USER admin
ENV JENKINS_PASS admin
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV JENKINS_HOME /var/jenkins_home

VOLUME /var/jenkins_home

# User creation in Jenkins
COPY init.groovy /var/jenkins_home/init.groovy

# Install plugins
COPY plugins.txt .
RUN /usr/local/bin/install-plugins.sh `cat plugins.txt`

EXPOSE 8080 50000