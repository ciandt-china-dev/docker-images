FROM node:16-slim

LABEL maintainer="jason@ciandt.com"

RUN apt-get update \
  && apt-get install -y --no-install-recommends python3 build-essential apt-utils \
  && apt-get clean \
  && npm install -g npm@latest webpack@latest node-gyp@latest gulp@latest \
  && npm cache clean --force

VOLUME /app

WORKDIR /app
