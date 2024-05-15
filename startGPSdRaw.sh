#!/bin/bash 

sudo systemctl stop gpsd.socket
sudo systemctl disable gpsd.socket
sudo killall gpsd



#if we have REVE, set speed to 57600 
if [[ -f /REV ]] ; 
then 
  rev=`cat /REV` 
  echo "rev is $rev" 
  if [[ $rev == "E" ]] 
  then 
    echo "Changing baud rate" 
    ubxtool -s 9600 -S 57600 -f  /dev/ttyGPS
    stty -F /dev/ttyGPS 57600
  fi
  if [[ $rev == "F" ]] 
  then 
    echo "Changing baud rate" 
    ubxtool -s 38400 -S 115200 -f  /dev/ttyGPS
    stty -F /dev/ttyGPS 115200
  fi

fi

sudo gpsd /dev/ttyGPS -F /var/run/gpsd.sock 
sudo mkdir -p /data/gps  && sudo chown rno-g:rno-g /data/gps

