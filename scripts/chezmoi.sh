#!/usr/bin/env bash

source "config.sh"
source "lib.sh"

repository="twpayne/chezmoi"

latest_release=$(get_latest_release "$repository")
latest_release="${latest_release:1}"

dnf install "${GITHUB_HTTPS}/${repository}/releases/download/v${latest_release}/chezmoi-${latest_release}-x86_64.rpm"
