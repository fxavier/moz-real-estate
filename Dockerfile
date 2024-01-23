FROM python:3.12.1-alpine3.19
LABEL maintainer="Xavier Nhagumbe"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt

COPY . /app 

WORKDIR /app

EXPOSE 8000

RUN apk add --update --no-cache postgresql-client && \
    pip3 install --upgrade pip && \
    pip3 install -r /requirements.txt && \
    adduser -D --no-create-home app 

USER app