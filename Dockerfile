FROM docker

FROM golang:1.12-alpine
RUN apk update
RUN apk add --no-cache make bash git python2 gcc
RUN apk add --no-cache --virtual deps py2-pip python-dev linux-headers musl-dev libffi-dev openssl-dev
RUN pip install --no-cache-dir docker-compose
RUN apk del deps
ENV DOCKER_HOST: tcp://docker:2375/

COPY --from=0 /usr/local/bin/docker /usr/local/bin/
