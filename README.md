# Jenkins with Maven Image



Based on [jenkins/jenkins](https://hub.docker.com/r/jenkins/jenkins/)

# Usage
```
docker build -t 'jenkis-elvikito' .

docker run -d -p 80:8080 -p 50000:50000 jenkis-elvikito
```
Then, can access Jenkins via http://localhost:80

In first time, need unlock Jenkins, enable to find the generated password via:
```
docker logs <running-container-id>
```

