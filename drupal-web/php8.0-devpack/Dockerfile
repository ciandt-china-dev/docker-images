FROM ciandtchina/drupal-web:php8.0-fpm-apache

ENV MEMCACHED_VERSION 3.0.4

# Install PHP xdebug extension
RUN pecl install xdebug-3.1.5 && docker-php-ext-enable xdebug

# Default xdebug configuration.
COPY config/* /usr/local/etc/php/conf.d/
