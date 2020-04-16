#!/usr/bin/env bash

. "config.sh"
. "lib.sh"

repository="gitahead/gitahead"
latest_release=""

gitahead_dir="${HOME}/.local/share"
gitahead_download_dir="/tmp"

if [[ -d "${gitahead_dir}/GitAhead" ]]; then
	echo "GitAhead is already installed!"
	exit 0
fi

latest_release=$(get_latest_release "$repository")

if [[ ! -f "${gitahead_download_dir/GitAhead.sh}" ]]; then
	wget "${GITHUB_HTTPS}/${repository}/releases/download/${latest_release}/GitAhead-2.6.1.sh" -O "${gitahead_download_dir}/GitAhead.sh"
	chmod +x "${gitahead_download_dir}/GitAhead.sh"
fi

yes | ${gitahead_download_dir}/GitAhead.sh --prefix=${gitahead_dir}

exit 0
