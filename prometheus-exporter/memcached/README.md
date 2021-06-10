

# Docker version for Memcached exporter for Prometheus

Github: [prometheus_memcached_exporter](https://github.com/prometheus/memcached_exporter)

docker-composer example:

    exporter:
        image: quay.io/prometheus/memcached-exporter:latest
        ports:
            - "9150:9150"
        command: ["--memcached.address", "memcached"]
        depends_on:
            - memcached