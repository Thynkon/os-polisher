#!/usr/bin/env bash

cat >> "/etc/sddm/Xsetup" <<- EOM
# Dual monitor setup
xrandr --output DVI-D-0 --mode 1920x1080  --output HDMI-0 --mode 1920x1080 --primary --left-of DVI-D-0
EOM

exit 0
