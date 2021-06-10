

# Docker version for Nginx exporter for Prometheus

Github: [prometheus_nginx_exporter](https://github.com/nginxinc/nginx-prometheus-exporter)



Nginx setup - [stub_status](https://nginx.org/en/docs/http/ngx_http_stub_status_module.html#stub_status)

    location /basic_status {
        stub_status;
    }


docker-composer example:

    nginx_exporter:
        image: nginx/nginx-prometheus-exporter:0.9.0
        ports:
            - "9113:9113"
        command: ["-nginx.scrape-uri=http://nginx/basic_status"]
        # make sure the exporter is in the same network of nginx
        networks:
            - default-network
        depends_on:
            - nginx