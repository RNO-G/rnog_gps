#!/bin/bash -e

ofile=${1-`date -Is`}
SECS=${2-600}

for dev in GPS Z9P ; do
gpspipe -R ::/dev/tty$dev "-x $SECS" > /data/gps/$dev-$ofile.ubx &
done
wait

gzip /data/gps/GPS-$ofile.ubx
gzip /data/gps/Z9P-$ofile.ubx


