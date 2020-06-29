#!/bin/bash
BOARD=$1
DO_TELE=$2
if [ "$BOARD" == "SDMC" ]; then
  sudo cp SDMC/sdmc_remote.txt /media/$USER/STORAGE/.config/rc_keymaps/
  sudo cp SDMC/rc_maps.cfg /media/$USER/STORAGE/.config/
  echo "aml_fe_avl62x1_av201x" | sudo tee -a /media/$USER/STORAGE/.config/modules-load.d/aml_fe_avl62x1_av201x.conf
elif [ "$BOARD" == "vim2" ]; then
  sudo cp vim2/rc_maps.cfg /media/$USER/STORAGE/.config/
  echo "aml_fe_avl68x2_r848" | sudo tee -a /media/$USER/STORAGE/.config/modules-load.d/aml_fe_avl68x2_r848.conf
elif [ "$BOARD" == "meCoolK2pro" ]; then
  sudo cp meCool/remote.conf /media/$USER/COREELEC/
  echo "aml_fe_avl68x2_r848" | sudo tee -a /media/$USER/STORAGE/.config/modules-load.d/aml_fe_avl68x2_r848.conf
else
  echo "UNKNOWN board '$BOARD'"
  exit 1
fi
sudo cp ~/.ssh/id_rsa.pub /media/$USER/STORAGE/.ssh/authorized_keys
sudo chmod 600 /media/$USER/STORAGE/.ssh/authorized_keys
sudo cp target/addons/9.2/Amlogic/arm/service.tvheadend42/service.tvheadend42-9.2.*.zip /media/$USER/STORAGE/
sudo ssh-keygen -f /media/$USER/STORAGE/.ssh/id_rsa -N ""
sudo cat /media/$USER/STORAGE/.ssh/id_rsa.pub
if [ "$DO_TELE" == "telemetry" ]; then
  pushd ../net_srv
  if [ "$?" == "0" ]; then
    make arm64
    sudo cp avl_net_srv /media/$USER/STORAGE/.config/
    sudo cp autostart.sh /media/$USER/STORAGE/.config/
    sudo cp telemetry.sh /media/$USER/STORAGE/.config/
    sudo cp -r avltools /media/$USER/STORAGE/
    popd
  fi
fi
sync

umount /media/$USER/STORAGE/
umount /media/$USER/COREELEC/
