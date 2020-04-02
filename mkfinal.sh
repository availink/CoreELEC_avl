#!/bin/bash
BOARD=$1
if [ "$BOARD" == "SDMC" ]; then
  sudo cp SDMC/sdmc_remote.txt /media/$USER/STORAGE/.config/rc_keymaps/
  sudo cp SDMC/rc_maps.cfg /media/$USER/STORAGE/.config/
elif [ "$BOARD" == "vim2" ]; then
  sudo cp vim2/rc_maps.cfg /media/$USER/STORAGE/.config/
elif [ "$BOARD" == "meCoolK2pro" ]; then
  sudo cp meCool/remote.conf /media/$USER/COREELEC/
else
  echo "UNKNOWN board '$BOARD'"
  exit 1
fi
sudo cp ~/.ssh/id_rsa.pub /media/$USER/STORAGE/.ssh/authorized_keys
sudo chmod 600 /media/$USER/STORAGE/.ssh/authorized_keys
sudo cp target/addons/9.2/Amlogic/arm/service.tvheadend42/service.tvheadend42-9.2.*.zip /media/$USER/STORAGE/
sync
