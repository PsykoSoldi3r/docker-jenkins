# Jenkins Docker Image

This repository is not ready for use!

## Plugins
```
blueocean:latest
build-timeout:latest
email-ext:latest
workflow-aggregator:latest
pipeline-github-lib:latest
ssh-slaves:latest
timestamper:latest
ws-cleanup:latest
```
Would you like to have more preinstalled plugins on your docker image? Fork this repository and edit the [`plugins.txt`](https://github.com/PsykoSoldi3r/docker-jenkins/blob/master/plugins.txt)

## Usage

Make sure you have installed docker on your system. [More information](https://docs.docker.com/get-started/)

### Build Image
```
docker-composer build
```

### Run Image
```
docker run -d -p 8080:8080 --name jenkins psykosoldi3r/jenkins
```

### Run Container
```
docker run jenkins
```

### Stop Container
```
docker stop jenkins
```

### Initial Admin Password
Make sure your docker jenkins image is running. At first time of navigating to `http://localhost:8080` Jenkins is asking for an initial password. You can get the initial password by executing this command
```
docker exec %DOCKER_NAME% cat /var/jenkins_home/secrets/initialAdminPassword
```

## Default User

### Coming Soon...

```
username: admin
password: admin
```
Don't forget to change the password of the admin account. Or create a new one and remove the default user

## Digital Ocean

### Deploy
1. Create a new droplet with the pre installed docker image (can be found under `One-click apps`)
2. Use the following script for the user data 
```bash
#!/bin/bash

apt-get -y update
apt-get -y install git
git clone https://github.com/PsykoSoldi3r/docker-jenkins.git
cd docker-jenkins
docker-compose build
docker run -p 8080:8080 -d --name jenkins psykosoldi3r/jenkins
```
3. Build your droplet. After your droplet is created, Jenkins should run on `DROPLET_IP:8080` (its takes some time before jenkins is up after droplet is created)