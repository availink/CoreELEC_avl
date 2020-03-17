#!/bin/bash
PROJECT=Amlogic DEVICES=S905 ARCH=arm make image
rm target/addons/9.2/Amlogic/arm/service.tvheadend42/service.tvheadend42-9.2.*
PROJECT=Amlogic DEVICES=S905 ARCH=arm scripts/create_addon tvheadend42
