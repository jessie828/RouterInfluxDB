#!/bin/sh

dir=`dirname $0`

name="router_uptime"
columns="uptime load_1_min load_5_min load_15_min"
points=$(uptime | sed 's/.*up \(.*\) days,  \(.*\)[: ]\(.*\),  load average: \(.*\), \(.*\), \(.*\)/\1 \2 \3 \4 \5 \6/g' |  awk '{if ($3 ~ /^[0-9]+$/) {print ($1 * 24 *  60 * 60) + ($2 * 60 * 60) + ($3 * 60), $4, $5, $6} else print ($1 * 24 * 60 * 60) + ($2 * 60), $4, $5, $6}')

$dir/todb.sh "${name}" "${columns}" "${points}"
