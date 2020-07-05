#!/usr/bin/env bash

. "config.sh"
. "lib/lib.sh"

# Usefull for debugging
# set -x

software_name="dbeaver"
repository="${software_name}/${software_name}"
latest_release=""

download_directory="/tmp"

rpm -qa --quiet > /dev/null 2>&1 | grep -i "${software_name}"
if [[ $? -eq 0 ]]; then
	echo "${software_name} is already installed!"
	echo "Exiting..."
	exit 0
fi

latest_release=$(get_latest_release "$repository")
computer_architecture=$(uname -i)
binary_filename="${software_name}-${latest_release}.${computer_architecture}.rpm"

if [[ -f "${download_directory}/${binary_filename}" ]]; then
	echo "RPM file already exists!"
	echo "Skipping download"
else
	wget "${GITHUB_HTTPS}/${repository}/releases/download/${latest_release}/${software_name}-ce-${latest_release}-stable.${computer_architecture}.rpm" \
		-O "${download_directory}/${binary_filename}"
fi

dnf install -y "${download_directory}/${binary_filename}"

exit 0
