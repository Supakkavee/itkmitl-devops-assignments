# Bookinfo Rating Service

Rating service has been developed on NodeJS

## License

MIT License

## How to run

```bash
node ratings.js 8080
```
## How to run with Docker

```bash
# Build Docker Image for rating service
docker build -t ratings .

# Run MongoDB with initial data in database
docker run -d --name mongodb -p 27017:27017 \
  -v $(pwd)/databases:/docker-entrypoint-initdb.d bitnami/mongodb:5.0.2-debian-10-r2

# Run ratings service on port 8080
docker run -d --name ratings -p 8080:8080 --link mongodb:mongodb \
  -e SERVICE_VERSION=v2 -e 'MONGO_DB_URL=mongodb://mongodb:27017/ratings' ratings
```

* Test with path `/ratings/1` and `/health`

## How to run with Docker Compose

```bash
docker-compose up
```

## Website

[Opsta (Thailand) Co., Ltd.](https://www.opsta.co.th)
