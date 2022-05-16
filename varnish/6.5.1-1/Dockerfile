FROM debian:bullseye as modules

#https://github.com/emgag/docker-varnish/blob/master/6.6/Dockerfile
ARG BUILD_TOOLS=" \
    make \
    automake \
    autotools-dev \
    autoconf-archive \
    libedit-dev \
    libjemalloc-dev \
    libncurses-dev \
    libpcre2-dev \
    libtool \
    libvarnishapi-dev \
    libossp-uuid-dev \
    pkg-config \
    python3-docutils \
    python3-sphinx \
    git \
    curl \
    cpio "

  
RUN set -e; \
  apt-get update; \
  apt-get install -y --no-install-recommends $BUILD_TOOLS; \
  apt-get clean \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists/*

ENV PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig/
ENV VMOD_UUID_VERSION=1.9

# Install ibvmod-uuid and compile.
RUN cd /tmp \
  && curl -o /tmp/libvmod-uuid.tar.gz -SL https://github.com/otto-de/libvmod-uuid/archive/refs/tags/v${VMOD_UUID_VERSION}.tar.gz \
  && tar -zxvf /tmp/libvmod-uuid.tar.gz  -C /tmp/ \
  && rm -rf  /tmp/libvmod-uuid.tar.gz \
  && cd libvmod-uuid-${VMOD_UUID_VERSION} \
  && ./autogen.sh \
  && ./configure \ 
  && make \
  && make install \
  && ldconfig

FROM    varnish:6.5.1-1

LABEL   maintainer="ceniym@ciandt.com"

# Install uuid required module
RUN set -e; \
  apt-get update; \
  apt-get install -y --no-install-recommends libossp-uuid-dev; \
  apt-get clean \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists/*

COPY --from=modules /usr/lib/x86_64-linux-gnu/varnish/vmods/* /usr/lib/varnish/vmods/

COPY    bin/docker-varnish-entrypoint.sh /usr/local/bin/docker-varnish-entrypoint

ENV     VARNISHNCSA_FORMAT='%h %l %u %t "%r" %s %b "%{Referer}i" "%{User-agent}i"'

EXPOSE  80 8443 6082