FROM composer:2.3.10

LABEL maintainer="jason@ciandt.com"

RUN apk upgrade --update && apk add \
      libjpeg-turbo-dev \
      libpng-dev \
  	libzip-dev \
	zip \
      icu-dev \
	&& docker-php-ext-configure gd --with-jpeg \
	&& docker-php-ext-install gd pdo pdo_mysql zip intl