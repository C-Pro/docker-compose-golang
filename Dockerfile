FROM docker

FROM golang:1.12-alpine
RUN apk update
RUN apk add --no-cache --virtual deps gcc py2-pip python-dev
RUN apk add --no-cache make bash git \
    && pip install --no-cache-dir docker-compose
RUN apk remove deps

COPY --from=0 /usr/local/bin/docker /usr/local/bin/
