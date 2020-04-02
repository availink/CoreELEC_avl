#!/bin/bash
IMG=$1
BOARD=$2
DEV=$3
if [[ "$DEV" == "" ]]; then
  DEV="mmcblk0"
  PART1="p1"
  PART2="p2"
elif [[ "$DEV" == "sda"* ]]; then
  echo "REFUSING TO DD TO $DEV"
  exit 1
elif [[ "$DEV" == "sd"* ]]; then
  PART1="1"
  PART2="2"
fi

udisksctl unmount --block-device /dev/${DEV}${PART1}
udisksctl unmount --block-device /dev/${DEV}${PART2}

gunzip ${IMG} --to-stdout | sudo dd of=/dev/$DEV bs=4K status=progress

sleep 5
udisksctl mount --block-device /dev/${DEV}${PART1}
#udisksctl mount --block-device /dev/mmcblk0p2
./mkdtb.sh $BOARD
sync
udisksctl unmount --block-device /dev/${DEV}${PART1}
#udisksctl unmount --block-device /dev/mmcblk0p2
