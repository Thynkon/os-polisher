#!/usr/bin/env bash

mode=$1

if [ "${mode}" = "desktop" ]; then
	cat >> "/etc/sddm/Xsetup" <<- EOM
	# Dual monitor setup
	xrandr --output DVI-D-0 --mode 1920x1080  --output HDMI-0 --mode 1920x1080 --primary --left-of DVI-D-0
	EOM
else
	cat >> "/etc/X11/xorg.conf.d/00-brightness.conf" <<- EOM
	Section "Device"
		Identifier  "Intel Graphics"
		Driver      "intel"
		Option      "Backlight"  "intel_backlight"
	EndSection
	EOM
fi

exit 0
