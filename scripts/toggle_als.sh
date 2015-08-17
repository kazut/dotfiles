#!/bin/sh
a=`cat /sys/devices/platform/hp-wmi/als`
let a=1^a
sudo -s eval "echo $a >/sys/devices/platform/hp-wmi/als"

