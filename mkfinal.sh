#!/bin/bash
BOARD=$1
if [ "$BOARD" == "SDMC" ]; then
  sudo cp SDMC/sdmc_remote.txt /media/tom/STORAGE/.config/rc_keymaps/
  sudo cp SDMC/rc_maps.cfg /media/tom/STORAGE/.config/
elif [ "$BOARD" == "vim2" ]; then
  sudo cp vim2/rc_maps.cfg /media/tom/STORAGE/.config/
else
  echo "UNKNOWN board '$BOARD'"
  exit 1
fi
sudo cp ~/.ssh/id_rsa.pub /media/tom/STORAGE/.ssh/authorized_keys
sudo chmod 600 /media/tom/STORAGE/.ssh/authorized_keys
sudo cp target/addons/9.2/Amlogic/arm/service.tvheadend42/service.tvheadend42-9.2.*.zip /media/tom/STORAGE/
sync
