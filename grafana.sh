#!/bin/bash

apt update
apt install -y gnupg
wget -q -O - https://packages.grafana.com/gpg.key | apt-key add -
echo "deb https://packages.grafana.com/oss/deb stable main" | tee -a /etc/apt/sources.list.d/grafana.list
apt update
apt install -y grafana
systemctl enable grafana-server.service
systemctl start grafana-server.service