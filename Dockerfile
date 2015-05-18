FROM mhart/alpine-iojs:latest

RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories

RUN apk update && \
  apk add bash && \
  apk add git && \
  apk add python && \
  apk add make gcc g++ paxctl curl && \
  apk add graphicsmagick@testing && \
  rm -rf /var/cache/apk/*

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD COPY package.json /usr/src/app/
ONBUILD RUN npm install
ONBUILD COPY . /usr/src/app
