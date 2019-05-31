# Jenkins with Maven Image

Based on [jenkins/jenkins](https://hub.docker.com/r/jenkins/jenkins/)

# Usage
```
docker run -d -p 80:8080 -p 50000:50000 jenkins-maven
```
Then, can access Jenkins via http://localhost:80

In first time, need unlock Jenkins, enable to find the generated password via:
```
docker logs <running-container-id>
```

