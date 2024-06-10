#!/bin/bash
#
# moonraker-loader.sh DEVICE
# DEVICE is a mountable device node from /dev
#
# takes a device, mounts it temporarily, looks for *.gcode & *.gc
# in the root directory.
# All found files are uploaded to moonraker, and then the device is unmounted


HOST="127.0.0.1"
PORT="80"

DEVICE=$1
id
# check input
if [ -z "$DEVICE" ]; then
   exit 1
fi

# test that this device isn't already mounted
device_is_mounted=`grep ${DEVICE} /etc/mtab`
if [ -n "$device_is_mounted" ]; then
   echo "error: seems /dev/${DEVICE} is already mounted"
   exit 1
fi


# pull in useful variables from vol_id
eval `/sbin/blkid -o export /dev/${DEVICE}`

DIR=`mktemp -d`
systemd-mount -o ro --automount=yes --collect /dev/${DEVICE} ${DIR} 
#The magic happens here
shopt -s nocaseglob
echo "got here"
for file in ${DIR}/*.{gcode,gc}
do
    echo "${file} pretest"
    [ -e "${file}" ] || continue
    echo "uploading ${file}"
    curl -F "file=@${file}" -F "root"="gcodes" "http://${HOST}:${PORT}/server/files/upload"
done
#cleanup  
systemd-umount ${DIR}
rmdir ${DIR}
curl --header "Content-Type: application/json"   --request POST --data '{"commands":["M117 Copy Complete"] }'   "http://${HOST}:${PORT}/api/printer/command"
