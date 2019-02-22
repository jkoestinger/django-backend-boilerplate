FROM python:3.7-alpine

ENV PYTHONUNBUFFERED 1

RUN mkdir /app

WORKDIR /app

ADD . /app

RUN rm -rf /app/db.sqlite3 && pip install -r requirements.txt