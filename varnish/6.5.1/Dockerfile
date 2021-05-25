FROM    varnish:6.5.1

LABEL   maintainer="ceniym@ciandt.com"

COPY    bin/docker-varnish-entrypoint.sh /usr/local/bin/docker-varnish-entrypoint

ENV     VARNISHNCSA_FORMAT='%h %l %u %t "%r" %s %b "%{Referer}i" "%{User-agent}i"'

EXPOSE  80 8443 6082