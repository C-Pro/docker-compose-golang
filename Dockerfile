FROM docker

FROM golang:1.11-alpine

RUN apk add --no-cache make py2-pip bash git \
    && pip install --no-cache-dir docker-compose

COPY --from=0 /usr/local/bin/docker /usr/local/bin/
