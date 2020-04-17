#!/usr/bin/env bash

source "config.sh"

git_repo="$GITHUB_SSH:$GITHUB_USERNAME/dotfiles"

# Setup dotfiles
chezmoi init "$git_repo" "$HOME/dev/dotfiles"

if [[ $? -eq 1 ]]; then
	echoerr "Failed to clone dotfiles repository!\n"
	echoerr "Check your ssh keys!\n"

	exit 1
fi

# Generate files from templates and copy them to /home
chezmoi apply

exit 0
