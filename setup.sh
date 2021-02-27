#!/bin/sh


echo 'checking if cron tabs are not already set'
count=$(cru l | grep routerstats.sh | wc -l)

if [ -z "${count}" ]
then
    echo 'setting up the cron tabs'
    cru a routerstats "* * * * * /jffs/scripts/routerstats.sh"
    cru a "routerstats+30" "* * * * * (sleep 30; /jffs/scripts/routerstats.sh)"
else
    echo 'cron tabs with same name already exists.'
    echo 'exiting now'
fi

