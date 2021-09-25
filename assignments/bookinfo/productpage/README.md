# How to run product page

## Prerequisite

* Python 3.8

```bash
pip install -r requirements.txt
python productpage.py 9080
```
## Build Docker Image for details service
```bash
docker build -t productpage .
```

## Run details service on port 8083
```bash
docker run -d -p 8083:9080 --name productpage
```