# Jenkins Docker Image

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

## Usage

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