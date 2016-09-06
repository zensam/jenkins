### jenkins in docker for Max

#### Pull image
```bash
docker pull zensam/jenkins
```

#### Run container
```bash
docker run -d --name jenkins -p 8888:8080 -p 50000:50000 <image ID>
```
