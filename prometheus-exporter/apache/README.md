

# Docker version for Apache exporter for Prometheus

Github: [prometheus_apache_exporter](https://github.com/Lusitaniae/apache_exporter)

docker-composer example:

    exporter:
        image:  bitnami/apache-exporter:latest
        ports:
            - "9117:9117"
        command: ["--scrape_uri='http://web-server/server-status?auto'"]
        depends_on:
            - web-server