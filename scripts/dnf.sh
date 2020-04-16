#!/usr/bin/env bash

source "config.sh"

declare -A dnf_options
dnf_options[fastestmirror]=1
dnf_options[deltarpm]=1

for option in "${!dnf_options[@]}"; do
	# Only enable these settings if they aren't already set
	if ! grep -q "$option=${dnf_options[$option]}" $DNF_CONFIG; then
		echo "$option=${dnf_options[$option]}" >> $DNF_CONFIG
	fi
done

dnf install -y $RPM_FUSION_FREE $RPM_FUSION_NONFREE
dnf update -y

exit 0
