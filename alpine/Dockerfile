FROM composer:latest

LABEL maintainer="jason@ciandt.com"

RUN apk upgrade --update && apk add \
      libjpeg-turbo-dev \
      libpng-dev \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-install gd pdo pdo_mysql zip