FROM ciandtchina/drupal-web:php7.1-apache

LABEL maintainer="jason@ciandt.com"

RUN set -e; \
	apt-get update; \
	apt-get install -y --no-install-recommends libssh2-1-dev; \
	pecl install ssh2-1.1.2; \
	docker-php-ext-enable ssh2;
