FROM php:7.1-apache

LABEL maintainer="jason@ciandt.com"

ENV DRUSH_VERSION 8.1.18
ENV DRUSH_LAUNCHER_VERSION 0.6.0
ENV DRUSH_LAUNCHER_FALLBACK "/usr/local/drush/drush"
ENV MEMCACHED_VERSION 3.0.4

# Install necessary packages and PHP extensions for both Drupal 7 and 8
# Drupal 7 PHP requirement: https://www.drupal.org/docs/7/system-requirements/drupal-7-php-requirements#extensions
# Drupal 8 PHP requirement: https://www.drupal.org/docs/8/system-requirements/php-requirements
RUN a2enmod rewrite \
  && apt-get update && apt-get install -y --no-install-recommends \
      mariadb-client \
      libpng-dev \
      libjpeg-dev \
      libpq-dev \
      libxml2-dev \
      nano \
      libmemcached-dev \
      rsyslog \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-install gd pdo pdo_mysql pdo_pgsql zip opcache sockets soap \
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
  && sed -i 's/\/var\/www\/html/\/var\/www\/html\/docroot/g' /etc/apache2/sites-available/000-default.conf \
  # Remove old Apache ServerTokens & ServerSignature
  && sed -i "/^ServerTokens/d; /^ServerSignature/d" /etc/apache2/apache2.conf \
  # Add new Apache ServerTokens & ServerSignature
  && echo 'ServerTokens Prod\nServerSignature Off' >> /etc/apache2/apache2.conf

COPY config/php.ini /usr/local/etc/php/conf.d/

COPY config/rsyslog.conf /etc/rsyslog.conf

# Add default user `docker` and modify user id and group id
RUN groupadd -r -g 1001 docker && useradd --no-log-init -r -u 1000 -g docker docker \
  && echo '#!/bin/bash\nset -e\n\
[[ $(id -u docker) != ${CURRENT_USER_UID:-1000} ]] && usermod -u ${CURRENT_USER_UID:-1000} docker\n\
[[ $(id -g docker) != ${CURRENT_USER_GID:-1001} ]] && groupmod -g ${CURRENT_USER_GID:-1001} docker\n\
chown -R docker:docker /var/www/html\n\
nohup rsyslogd -n -f /etc/rsyslog.conf &\n\
apache2-foreground' > /start.sh && chmod 755 /start.sh \
  # Install Drush
  && mkdir -p /usr/local/drush \
  && curl -fsSL -o /usr/local/drush/drush "https://github.com/drush-ops/drush/releases/download/$DRUSH_VERSION/drush.phar" \
  && curl -fsSL -o /usr/local/bin/drush https://github.com/drush-ops/drush-launcher/releases/download/${DRUSH_LAUNCHER_VERSION}/drush.phar \    
  && chmod +x /usr/local/drush/drush /usr/local/bin/drush \
  && drush --version

CMD ["/start.sh"]
