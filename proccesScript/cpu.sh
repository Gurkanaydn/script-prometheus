#!/bin/bash

z=$(ps aux)
while read -r z
do
    var=$var$(awk '{print "procces_cpu_usage{procces=\""$11"\",pid=\""$2"\"}",$3z}');
done <<< "$z"
curl -X POST -H "Content-Type: text/plain" --data "$var
" http://192.168.14.26:9091/metrics/job/top/instance/machine