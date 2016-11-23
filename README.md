### jenkins of 1.6XX version in docker

#### Pull image
```bash
docker pull zensam/jenkins:16xx
```

#### Run container
```bash
docker run -d --name jenkins -p 8888:8080 -p 50000:50000 <image ID>
```
