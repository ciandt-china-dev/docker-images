FROM ciandtchina/drupal-web:php7.4-apache

LABEL maintainer="jason@ciandt.com"

ENV MEMCACHED_VERSION 3.0.4

# Install PHP xdebug extension
RUN pecl install xdebug-2.9.8 && docker-php-ext-enable xdebug 

COPY config/* /usr/local/etc/php/conf.d/
