#!/usr/bin/env bash
# @authors Marcos Freitas

cd /opt \
&& curl -O -L "https://github.com/grafana/agent/releases/latest/download/grafana-agent-linux-amd64.zip" \
&& unzip "grafana-agent-linux-amd64.zip" \
&& chmod a+x grafana-agent-linux-amd64 \
&& cat << EOF > /opt/agent-config.yaml
metrics:
  global:
    scrape_interval: 10s
  configs:
  - name: skinny-host-nginx-laravel
    scrape_configs:
      - job_name: laravel
        scrape_interval: 10s
        metrics_path: /prometheus
        static_configs:
        - targets: ['localhost:8080']
      - job_name: nginx
        scrape_interval: 10s
        metrics_path: /metrics
        static_configs:
        - targets: ['localhost:8080']
    remote_write:
      - url: https://prometheus-prod-40-prod-sa-east-1.grafana.net/api/prom/push
        basic_auth:
          username: 1164264
          password: glc_eyJvIjoiOTMzMTA3IiwibiI6InNraW5ueS1ob3N0IiwiayI6ImRaRDY3MzMwNVhGajgwS1lEdzByOVBtciIsIm0iOnsiciI6InByb2Qtc2EtZWFzdC0xIn19
EOF