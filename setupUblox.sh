#!/bin/bash -e


for dev in /dev/ttyZ9P /dev/ttyGPS ; do

ubxtool -d NMEA -f $dev #disable NMEA messages
ubxtool -e BINARY  -f $dev#enable binary messages

ubxtool -e BEIDOU -f $dev
ubxtool -e GALILEO -f $dev
ubxtool -e GLONASS -f $dev
ubxtool -e SBAS -f $dev
ubxtool -e GPS -f $dev #enable only GPS constellation

#ubxtool -p CFG-GNSS #confirm enabled constellations
ubxtool -e RAWX  -f $dev #enable raw measurement messages
ubxtool -e PPS  -f $dev #enable timpulse0 [pps]
ubxtool -e TP  -f $dev #enable tim-tp message
ubxtool -e MON-SPAN  -f $dev #enable tim-tp message

#ubxtool -w 4 | fgrep RAWX #confirm RAW messaging
#ubxtool -w 4 | fgrep TP


