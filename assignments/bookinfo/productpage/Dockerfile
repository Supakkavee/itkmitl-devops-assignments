FROM python:3.8

WORKDIR /usr/src/app

COPY requirements.txt /usr/src/app
COPY . /usr/src/app/

RUN pip install -r requirements.txt

CMD [ "python", "productpage.py", "9080"]