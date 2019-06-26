FROM docker

FROM golang:1.12-alpine
RUN apk update
RUN apk add --no-cache --virtual deps gcc py2-pip python-dev linux-headers musl-dev libffi-dev openssl-dev
RUN apk add --no-cache make bash git \
    && pip install --no-cache-dir docker-compose
RUN apk del deps

COPY --from=0 /usr/local/bin/docker /usr/local/bin/
