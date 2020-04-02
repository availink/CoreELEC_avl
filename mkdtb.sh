#!/bin/bash
BOARD=$1
if [ "$BOARD" == "SDMC" ]; then
  sudo cp /media/$USER/COREELEC/device_trees/gxl_SDMC.dtb /media/$USER/COREELEC/dtb.img
elif [ "$BOARD" == "vim2" ]; then
  sudo cp /media/$USER/COREELEC/device_trees/gxm_kvim2_vtv.dtb /media/$USER/COREELEC/dtb.img
else
  echo "UNKNOWN board '$BOARD'"
fi
