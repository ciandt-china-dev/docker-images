# docker-drupal-web
Standalone Apache/PHP container with necessary packages and extensions installed for Drupal

## Supported tags and respective `Dockerfile` links
-	[`7.2`, `latest` (*Dockerfile*)](https://github.com/ciandt-china-dev/docker-drupal-web/blob/master/php7.2/Dockerfile)
-	[`7.1` (*Dockerfile*)](https://github.com/ciandt-china-dev/docker-drupal-web/blob/master/php7.1/Dockerfile)

## The purpose of this container image

- Provide a php-fpm docker environment for Drupal 7 and 8, with all necessory PHP required extensions:
    - Drupal 7: https://www.drupal.org/docs/7/system-requirements/drupal-7-php-requirements#extensions
    - Drupal 8: https://www.drupal.org/docs/8/system-requirements/php-requirements

- Installed with memcached and it's PHP extension
- Installed sockets PHP extension for varnish module
- Installed rsyslog server for drupal core syslog module(Default redirect all output to /dev/stdout. You can mount your custom rsyslog.conf file to customize.)
- Installed git zip nodejs openssh-client python-dev and composer which Acquia BLT need.
 
## Reference
**Maintained by**:
[CI&T China DevOps Team](https://www.ciandt.com.cn)
