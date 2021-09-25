# How to run details service

## Prerequisite

## Build Docker Image for details service
```bash
docker build -t reviews .
```

## Run details service on port 8082
```bash
docker run -d --name reviews -p 8082:9080 -e 'ENABLE_RATINGS=true' --link ratings:ratings -e 'RATINGS_SERVICE=http://ratings:8080/' reviews
```