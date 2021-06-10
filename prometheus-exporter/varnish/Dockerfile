FROM alpine:latest

LABEL   maintainer="ceniym@ciandt.com"

# Add libc6-compat to fix the following error
# exec user process caused "no such file or directory"
RUN apk add --no-cache docker libc6-compat

COPY prometheus_varnish_exporter /bin/prometheus_varnish_exporter

EXPOSE 9131

ENTRYPOINT  [ "/bin/prometheus_varnish_exporter" ]
CMD ["-h"]