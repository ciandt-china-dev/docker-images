

# Docker version for Cloudwatch exporter for Prometheus

Github: [prometheus_cloudwatch_exporter](https://github.com/prometheus/cloudwatch_exporter)

docker-composer example:

    aws_cloudwatch_exporter:
        image: prom/cloudwatch-exporter
            ports:
                - "9106:9106"
            volumes:
                - ./config.yml:/config/config.yml