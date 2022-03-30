#!/bin/bash

sudo wget https://github.com/prometheus/prometheus/releases/download/v2.34.0/prometheus-2.34.0.linux-amd64.tar.gz
sudo tar xvf prometheus-2.34.0.linux-amd64.tar.gz
sudo mkdir /etc/prometheus
cd prometheus-2.34.0.linux-amd64
sudo cp -r console_libraries consoles /etc/prometheus
sudo cp promtool /etc/prometheus
sudo cp prometheus promtool /usr/local/bin
cd ..
sudo cp prometheus.yml /etc/prometheus
sudo cp prometheus.service /etc/systemd/system
sudo chown test:test /usr/local/bin/prometheus
sudo chown test:test /usr/local/bin/promtool
sudo chown -R test:test /etc/prometheus/consoles
sudo chown -R test:test /etc/prometheus/console_libraries
sudo chown -R test:test /var/lib/prometheus/
sudo systemctl daemon-reload
sudo systemctl start prometheus
sudo systemctl enable prometheus

sudo wget https://github.com/prometheus/node_exporter/releases/download/v1.3.1/node_exporter-1.3.1.linux-amd64.tar.gz
sudo tar xvf node_exporter-1.3.1.linux-amd64.tar.gz
cd node_exporter-1.3.1.linux-amd64
sudo cp node_exporter /usr/local/bin
cd ..
sudo useradd -rs /bin/false node_exporter
sudo cp node_exporter.service /lib/systemd/system
sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl enable node_exporter

sudo wget https://github.com/prometheus/mysqld_exporter/releases/download/v0.14.0/mysqld_exporter-0.14.0.linux-amd64.tar.gz
sudo tar xvf mysqld_exporter-0.14.0.linux-amd64.tar.gz
cd mysqld_exporter-0.14.0.linux-amd64
sudo cp mysqld_exporter /usr/local/bin
sudo chmod +x /usr/local/bin/mysqld_exporter
cd ..
sudo cp .mysqld_exporter.cnf /etc
sudo cp mysql_exporter.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable mysql_exporter
sudo systemctl start mysql_exporter
