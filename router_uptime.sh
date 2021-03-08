#!/bin/sh

dir=`dirname $0`

name="router_uptime"
columns="uptime load_1_min load_5_min load_15_min"
time=$(cat /proc/uptime | awk '{print $1}' | sed 's/\..*//g')
load=$(uptime | sed 's/.*,  load average: \(.*\), \(.*\), \(.*\)/\1 \2 \3/g' |  awk '{print $1, $2, $3}')
points=$(echo $time $load)

$dir/todb.sh "${name}" "${columns}" "${points}"
