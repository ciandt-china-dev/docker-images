FROM composer:2.0.8

LABEL maintainer="jason@ciandt.com"

RUN apk upgrade --update && apk add \
      libjpeg-turbo-dev \
      libpng-dev \
	  libzip-dev \
	  zip \
	&& docker-php-ext-configure gd --with-jpeg \
	&& docker-php-ext-install gd pdo pdo_mysql zip
