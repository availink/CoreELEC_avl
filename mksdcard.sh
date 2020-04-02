#!/bin/bash
IMG=$1
BOARD=$2
gunzip ${IMG} --to-stdout | sudo dd of=/dev/mmcblk0 bs=4K status=progress
sleep 5
udisksctl mount --block-device /dev/mmcblk0p1
#udisksctl mount --block-device /dev/mmcblk0p2
./mkdtb.sh $BOARD
sync
udisksctl unmount --block-device /dev/mmcblk0p1
#udisksctl unmount --block-device /dev/mmcblk0p2
