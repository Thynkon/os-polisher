#!/usr/bin/env bash

source "config.sh"

usage() {
	echo -e "${PROGRAM_NAME} usage:\n"
	echo -e "-h\t hostname"
	echo -e "-m\t mode"
	echo -e "-u\t username\n"
}

install_packages() {
	packages_list=""

	while IFS= read -r line; do
		packages_list+=$line"  "
	done < "$1"

	dnf install -y $packages_list
}


get_latest_release() {
	local latest_release=""
	latest_release=$(curl --silent "$GITHUB_API/repos/$1/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

	echo $latest_release
}

get_installation_info() {
	echo "Setup info:"
	
	for option in "${!installation_info[@]}"; do
		# Uppercase first character
		echo "$(tr '[:lower:]' '[:upper:]' <<< ${option:0:1})${option:1}: ${installation_info[${option}]}"
	done

	echo -e "\n"
}

change_hostname() {
	echo $hostname > $HOSTNAME_FILE
	hostname $hostname
}
