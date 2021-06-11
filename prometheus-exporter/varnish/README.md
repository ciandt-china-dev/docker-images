

# Docker version for Varnish exporter for Prometheus

Github: [prometheus_varnish_exporter](https://github.com/jonnenauha/prometheus_varnish_exporter)

docker-composer example:

    exporter:
        image: docker-varnish-exporter:1.0
        ports:
            - "9131:9131"
        command: ["-docker-container-name" , "${PROJECT_KEY}-varnish"]
        volumes:
            - /var/run/docker.sock:/var/run/docker.sock
        depends_on:
            - varnish