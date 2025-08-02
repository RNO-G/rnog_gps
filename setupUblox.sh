#!/bin/bash -e


for dev in /dev/ttyZ9P /dev/ttyGPS ; do

echo "Doing ::$dev"
ubxtool -d NMEA ::$dev #disable NMEA messages
ubxtool -e BINARY ::$dev #enable binary messages

ubxtool -e BEIDOU  ::$dev
ubxtool -e GALILEO  ::$dev
ubxtool -e GLONASS ::$dev
ubxtool -e SBAS ::$dev
ubxtool -e GPS ::$dev #enable only GPS constellation

#ubxtool -p CFG-GNSS #confirm enabled constellations
ubxtool -e RAWX ::$dev #enable raw measurement messages
ubxtool -e PPS ::$dev #enable timpulse0 [pps]
ubxtool -e TP  ::$dev #enable tim-tp message
#ubxtool -p MON-SPAN  ::$dev #enable tim-tp message

#ubxtool -w 4 | fgrep RAWX #confirm RAW messaging
#ubxtool -w 4 | fgrep TP


done
