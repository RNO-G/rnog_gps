#!/bin/bash -e

if [ ! -d /sys/class/gpio/gpio22 ]; then echo 22 > /sys/class/gpio/export; fi

echo high > /sys/class/gpio/gpio22/direction
