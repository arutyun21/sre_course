#!/bin/bash


wget https://github.com/prometheus/node_exporter/releases/download/v1.3.1/node_exporter-1.3.1.linux-amd64.tar.gz
# Распакуем его
tar xvf node_exporter-1.3.1.linux-amd64.tar.gz
# Скопируем его в необходимую директорию
cp node_exporter-1.3.1.linux-amd64/node_exporter /usr/local/bin/
# Сделаем его исполняемым
chmod +x /usr/local/bin/node_exporter
# Создадим директорию для texfile коллектора
mkdir -p /opt/prometheus_exporters/textfile
# Сменим владельца
chown prometheus:prometheus -R /opt/prometheus_exporters/textfile
# Создадим юнит для systemd
cat << EOF > /lib/systemd/system/node_exporter.service
[Unit]
Description=Node-Exporter service
[Service] 
User=prometheus 
Group=prometheus
ExecStart=/usr/local/bin/node_exporter --web.listen-address=0.0.0.0:9100 --collector.textfile.directory=/opt/prometheus_exporters/textfile
[Install] 
WantedBy=multi-user.target
EOF
# Запустим экспортер
systemctl daemon-reload
systemctl enable node_exporter.service
systemctl start node_exporter.service
# Добавим конфигурацию в Prometheus
cat << EOF >> /etc/prometheus/prometheus.yml
- job_name: node 
    static_configs:
        - targets: ['localhost:9100']
EOF
# Применим изменения Prometheus systemctl restart prometheus.service