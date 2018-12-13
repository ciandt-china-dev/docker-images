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
      rsyslog \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-install gd pdo pdo_mysql pdo_pgsql zip opcache sockets \
  # Install Memcached PHP extension
  && curl -L -o /tmp/memcached.tar.gz "https://github.com/php-memcached-dev/php-memcached/archive/v$MEMCACHED_VERSION.tar.gz" \
  && mkdir -p /usr/src/php/ext/memcached \
  && tar -C /usr/src/php/ext/memcached -zxvf /tmp/memcached.tar.gz --strip 1 \
  && docker-php-ext-configure memcached \
  && docker-php-ext-install memcached \
  # Clean up
  && rm /tmp/memcached.tar.gz \
	&& apt-get clean && rm -rf /var/lib/apt/lists/* \
  # Configure Apache web docroot
  && sed -i 's/\/var\/www\/html/\/var\/www\/html\/docroot/g' /etc/apache2/sites-available/000-default.conf

COPY config/php.ini /usr/local/etc/php/conf.d/

COPY config/rsyslog.conf /etc/rsyslog.conf

# Add default user `docker` and modify user id and group id
RUN groupadd -r -g 1001 docker && useradd --no-log-init -r -u 1000 -g docker docker \
  && echo '#!/bin/bash\nset -e\n\
[[ $(id -u docker) != ${CURRENT_USER_UID:-1000} ]] && usermod -u ${CURRENT_USER_UID:-1000} docker\n\
[[ $(id -g docker) != ${CURRENT_USER_GID:-1001} ]] && groupmod -g ${CURRENT_USER_GID:-1001} docker\n\
chown -R docker:docker /var/www/html\n\
nohup rsyslogd -n -f /etc/rsyslog.conf &\n\
apache2-foreground' > /start.sh && chmod 755 /start.sh

CMD ["/start.sh"]
