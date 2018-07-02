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
docker build -t psykosoldi3r/jenkins .
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

## Default User

If you want to change the default username and password. Its located in the Dockerfile and defined as environment variables. For now you need to turn on security manually at the Jenkins Configure Global Security settings
```
username: admin
password: admin
```
Tip: don't forget to change the password of the admin account. Or create a new one and remove the default user

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
docker build -t psykosoldi3r/jenkins .
docker run -d -p 8080:8080 -p 50000:50000 --name jenkins psykosoldi3r/jenkins
```
3. Build your droplet. After your droplet is created, Jenkins should run on `DROPLET_IP:8080` (its takes some time before jenkins is up after droplet is created)