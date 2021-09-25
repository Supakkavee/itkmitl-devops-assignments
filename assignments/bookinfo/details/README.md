# How to run details service

## Prerequisite

* Ruby 2.7

```bash
ruby details.rb 9080
```

## Build Docker Image for details service
```bash
docker build -t details .
```

## Run details service on port 8081
```bash
docker run -d --name details -p 8081:9080 -e ENABLE_EXTERNAL_BOOK_SERVICE=true details
```