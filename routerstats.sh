#!/bin/sh

dir=`dirname $0`

$dir/router_cpu.sh
$dir/router_mem.sh
$dir/router_net.sh
$dir/router_ping_ext.sh
$dir/router_temp.sh
$dir/router_assoclist.sh
$dir/router_top.sh
$dir/router_df.sh
$dir/router_uptime.sh
