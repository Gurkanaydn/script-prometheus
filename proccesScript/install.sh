#!/bin/bash
wget https://github.com/prometheus/pushgateway/releases/download/v1.4.2/pushgateway-1.4.2.linux-amd64.tar.gz
tar xvf pushgateway-1.4.2.linux-amd64.tar.gz
cd pushgateway-1.4.2.linux-amd64
mv pushgateway /usr/local/bin
cd ..
cp pushgateway.service /etc/systemd/system
systemctl start pushgateway.service
systemctl enable pushgateway.service
systemctl status pushgateway.service