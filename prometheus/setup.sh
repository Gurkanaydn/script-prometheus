#!/bin/bash
ADDR=$(ip addr | grep -i -e "inet[[:space:]]" | awk 'NR==2{print $2}' | cut -d/ -f1)
BASE_FILE="./prometheus.base.yml"
echo $ADDR
sed "s/__HOST_IP__/$ADDR/g" $BASE_FILE > ./prometheus.new.yml
