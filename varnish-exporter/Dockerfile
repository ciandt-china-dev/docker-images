FROM golang:1.17 as build

ENV TAG_TO_BUILD="1.6.1"

WORKDIR /

RUN git clone --depth 1 --branch ${TAG_TO_BUILD} https://github.com/jonnenauha/prometheus_varnish_exporter.git

WORKDIR /prometheus_varnish_exporter

RUN go build


FROM alpine:3.7

# Add libc6-compat to fix the following error
# exec user process caused "no such file or directory"
RUN apk add --no-cache docker libc6-compat

COPY --from=build /prometheus_varnish_exporter/prometheus_varnish_exporter /bin/prometheus_varnish_exporter

EXPOSE 9131

ENTRYPOINT  [ "/bin/prometheus_varnish_exporter" ]
CMD ["-h"]