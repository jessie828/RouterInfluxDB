#!/bin/sh

# wl sta_info F8:16:54:8F:F6:6A

dir=`dirname $0`

name="router_assoclist_24"
columns="count"
p1=`wl -i eth5 assoclist | awk '{print $2}' | wc -l`
points="$p1"
$dir/todb.sh "$name" "$columns" "$points"

name="router_assoclist_50"
columns="count"
p1=`wl -i eth6 assoclist | awk '{print $2}' | wc -l`
points="$p1"
$dir/todb.sh "$name" "$columns" "$points"

name="router_assoclist_wired"
columns="count"
two=$(wl -i eth5 assoclist | awk '{print $2}' | tr '[A-Z]' '[a-z]')
five=$(wl -i eth6 assoclist | awk '{print $2}' | tr '[A-Z]' '[a-z]')
all=$(arp -n | grep -v 192.168.178.1 |  awk '{print $4}')
for mac in ${all}
do
    echo ${two} ${five} | grep ${mac} >/dev/null
    if [ $? -eq 1 ]
    then
        echo ${mac} >> /tmp/router_assoclist_wired.txt
    fi
done
p1=$(cat /tmp/router_assoclist_wired.txt | wc -l)
points="$p1"
$dir/todb.sh "$name" "$columns" "$points"
rm /tmp/router_assoclist_wired.txt
