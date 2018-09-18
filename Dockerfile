FROM php:7.2-apache

LABEL maintainer="jason@ciandt.com"

ENV MEMCACHED_VERSION 3.0.4

# Install necessary packages and PHP extensions for both Drupal 8
# Drupal 8 PHP requirement: https://www.drupal.org/docs/8/system-requirements/php-requirements
RUN a2enmod rewrite \
  && apt-get update && apt-get install -y --no-install-recommends \
      libpng-dev \
      libjpeg-dev \
      libpq-dev \
      libxml2-dev \
      nano \
      libmemcached-dev \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-install gd pdo pdo_mysql pdo_pgsql zip opcache \
  # Install Memcached PHP extension
  && curl -L -o /tmp/memcached.tar.gz "https://github.com/php-memcached-dev/php-memcached/archive/v$MEMCACHED_VERSION.tar.gz" \
  && mkdir -p /usr/src/php/ext/memcached \
  && tar -C /usr/src/php/ext/memcached -zxvf /tmp/memcached.tar.gz --strip 1 \
  && docker-php-ext-configure memcached \
  && docker-php-ext-install memcached \
  # Clean up
  && rm /tmp/memcached.tar.gz \
	&& apt-get clean && rm -rf /var/lib/apt/lists/*

COPY config/php.ini /usr/local/etc/php/conf.d/