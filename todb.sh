#/bin/sh

dbname=$(grep influxdb_databasename config.ini | awk '{print $3}')
dbhost=$(grep influxdb_server config.ini | awk '{print $3}')
dbport=$(grep influxdb_port config.ini | awk '{print $3}')
user=$(grep influxdb_user config.ini | awk '{print $3}')
passwd=$(grep influxdb_password config.ini | awk '{print $3}')

join() { local IFS="$1"; shift; echo "$*"; }

if [ $# -lt 3 ]; then
    echo "Usage: $0 \"series name\" \"columns\" \"points\""
    exit
fi

i=1
payload=''

for c in $2
do
    value=$( echo $3 | cut -d' ' -f$i )
    payload="$payload $1"
    if [ ! -z "$4" -a "$4" != " " ]
    then
        payload="$payload,$4"
    fi
    payload="$payload $c=$value"$'\n'
    i=$((i+1))
done

curl -i -XPOST "http://$dbhost:$dbport/write?db=$dbname" --data-binary "$payload"
