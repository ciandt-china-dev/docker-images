FROM cooptilleuls/varnish:6.0

LABEL maintainer="rockzhang@ciandt.com"

EXPOSE 6082

CMD ["varnishd", "-T", "0.0.0.0:6082", "-S", "none", "-F", "-f", "/usr/local/etc/varnish/default.vcl"]
