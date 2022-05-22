#!/bin/bash

platform='linux-amd64'
repo='prometheus/node_exporter'
tag=$(curl "https://api.github.com/repos/$repo/releases"|python3 -c "import sys,json; sys.stdout.write(json.load(sys.stdin)[0]['tag_name'])")
version="${tag:1}"
file="node_exporter-$version.$platform.tar.gz"
wget "https://github.com/$repo/releases/download/$tag/$file" -O node_exporter.tar.gz
tar -xvf node_exporter.tar.gz
mv node_exporter-* node_exporter
rm -rf node_exporter.tar.gz