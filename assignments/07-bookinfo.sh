#!/bin/sh
docker build -t details ./details
docker build -t productpage ./productpage
docker build -t ratings ./ratings
docker build -t reviews ./reviews

cd details
docker run -d --name details -p 8081:9080 -e ENABLE_EXTERNAL_BOOK_SERVICE=true details
cd ../ratings
docker run -d --name mongodb -p 27017:27017 \
  -v $(pwd)/databases:/docker-entrypoint-initdb.d bitnami/mongodb:5.0.2-debian-10-r2
docker run -d --name ratings -p 8080:8080 --link mongodb:mongodb \
  -e SERVICE_VERSION=v2 -e 'MONGO_DB_URL=mongodb://mongodb:27017/ratings' ratings
cd ../reviews
docker run -d --name reviews -p 8082:9080 -e 'ENABLE_RATINGS=true' --link ratings:ratings -e 'RATINGS_SERVICE=http://ratings:8080/' reviews
cd ../productpage
docker run -d -p 8083:9080 --name productpage --link reviews:reviews --link details:details --link ratings:ratings -e 'DETAILS_HOSTNAME=http://details:9080/details' -e 'RATINGS_HOSTNAME=http://ratings:8080/' -e 'REVIEWS_HOSTNAME=http://reviews:9080/' productpage
