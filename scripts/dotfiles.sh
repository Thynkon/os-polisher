#!/usr/bin/env bash

source "config.sh"

config_dir="${HOME}/.config/chezmoi"
git_repo="$GITHUB_SSH:$GITHUB_USERNAME/dotfiles"
email="marioferreira2110@gmail.com"
name="Mário Ferreira"

if [[ ! -d "${config_dir}" ]]; then
	mkdir -p "${config_dir}"
fi

cat >> "${config_dir}/chezmoi.toml" <<- EOM
[data]
	email = "\"${email}\""
	name = "\"${name}\""
EOM

# Setup dotfiles
chezmoi init "${git_repo}"

if [[ $? -eq 1 ]]; then
	echoerr "Failed to clone dotfiles repository!\n"
	echoerr "Check your ssh keys!\n"

	exit 1
fi

# Generate files from templates and copy them to /home
chezmoi apply

exit 0
