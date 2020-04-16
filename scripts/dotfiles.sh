#!/usr/bin/env bash

source "config.sh"

git_repo=""

git_repo+="$GITHUB_SSH:$GITHUB_USERNAME/dotfiles"
if [ "$mode" = "laptop" ]; then
	git_repo+="-laptop"
fi
git_repo+=".git"

# Setup dotfiles
git clone --bare "$git_repo" "$HOME/dev/dotfiles"

if [[ $? -eq 1 ]]; then
	echoerr "Failed to clone dotfiles repository!\n"
	echoerr "Check your ssh keys!\n"

	exit 1
fi

git --git-dir=$HOME/dev/dotfiles/ --work-tree=$HOME checkout -f
git --git-dir=$HOME/dev/dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no

exit 0
