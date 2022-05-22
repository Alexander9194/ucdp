#!/bin/bash

platform='linux-amd64'
repo='prometheus/prometheus'
tag=$(curl "https://api.github.com/repos/$repo/releases"|python3 -c "import sys,json; sys.stdout.write(json.load(sys.stdin)[0]['tag_name'])")
version="${tag:1}"
file="prometheus-$version.$platform.tar.gz"
wget "https://github.com/$repo/releases/download/$tag/$file" -O prometheus.tar.gz
tar -xvf prometheus.tar.gz
mv prometheus-* prometheus
rm -rf prometheus.tar.gz