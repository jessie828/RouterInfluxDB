# RouterInfluxDB

This comes from: https://www.instructables.com/id/How-to-graph-home-router-metrics/

First use the config.ini.example as a base for your influxDB configuration
Edit config.ini add InfluxDB settings
cron routerstats.sh:

`cru a routerstats "* * * * * /jffs/scripts/routerstats/routerstats.sh"`
`cru a "routerstats+30" "* * * * * (sleep 30; /jffs/scripts/routerstats/routerstats.sh)"`
`cru -l > /jffs/scripts/services-start`

These scripts will work on the default ROM shipped with the Asus RT-AC86U