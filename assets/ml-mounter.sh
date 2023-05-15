#!/bin/sh
#
# USAGE: usb-automounter.sh DEVICE 
#   DEVICE   is the actual device node at /dev/DEVICE

echo "foo:" ${1} >>/tmp/test
systemd-run /usr/local/sbin/moonraker-loader.sh ${1} &
