

# Docker version for Solr exporter for Prometheus

Github: [prometheus_solr_exporter](https://github.com/noony/prometheus-solr-exporter)

docker-composer example:

    solr_exporter:
        image: noony/prometheus-solr-exporter
        ports:
        - "9231:9231"
        command: ["--solr.address=http://solr:8983"]
        # To make sure the exporter is in the same network of solr
        networks:
        - default-network
        depends_on:
        - solr