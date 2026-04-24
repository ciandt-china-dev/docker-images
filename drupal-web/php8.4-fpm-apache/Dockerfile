FROM php:8.4-fpm-bookworm

ENV APACHE_CONFDIR=/etc/apache2 \
    APACHE_ENVVARS=/etc/apache2/envvars \
    DEBIAN_FRONTEND=noninteractive

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        apache2 \
        ca-certificates \
        default-mysql-client \
        exim4 \
        git \
        imagemagick \
        libavif-dev \
        libbz2-dev \
        libfreetype6-dev \
        libicu-dev \
        libjpeg62-turbo-dev \
        libmagickwand-dev \
        libmemcached-dev \
        libpng-dev \
        libpq-dev \
        libsasl2-dev \
        libwebp-dev \
        libxml2-dev \
        libzip-dev \
        rsyslog \
        unzip \
        zlib1g-dev; \
    docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp --with-avif; \
    docker-php-ext-install -j"$(nproc)" \
        bz2 \
        gd \
        intl \
        opcache \
        pdo_mysql \
        pdo_pgsql \
        soap \
        sockets \
        zip; \
    yes '' | pecl install apcu memcached imagick; \
    docker-php-ext-enable apcu memcached imagick; \
    a2dismod mpm_event || true; \
    a2enmod mpm_prefork proxy proxy_fcgi proxy_http rewrite; \
    sed -ri 's!^([[:space:]]*)DocumentRoot .+!\1DocumentRoot /var/www/html/docroot!' /etc/apache2/sites-available/000-default.conf; \
    sed -ri 's!^user = .+!user = docker!; s!^group = .+!group = docker!' /usr/local/etc/php-fpm.d/www.conf; \
    groupadd -g 1001 docker; \
    useradd -u 1000 -g docker -m -s /bin/sh docker; \
    ln -sf /usr/bin/mysqldump /usr/bin/mariadb-dump || true; \
    mkdir -p /var/www/html; \
    rm -rf /var/lib/apt/lists/*

COPY php.ini /usr/local/etc/php/conf.d/zz-nshr-local.ini
COPY docker-php.conf /etc/apache2/conf-enabled/docker-php.conf
COPY apache2-foreground /usr/local/bin/apache2-foreground
COPY start.sh /start.sh

RUN chmod +x /usr/local/bin/apache2-foreground /start.sh

WORKDIR /var/www/html
EXPOSE 80
CMD ["/start.sh"]
