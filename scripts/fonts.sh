#!/usr/bin/env bash

source "config.sh"


readonly POWERLEVEL10k_MEDIA_REPO="romkatv/powerlevel10k-media"
readonly NERD_FONTS_REPO="ryanoasis/nerd-fonts"

# MesloLGS
kfontinst "${GITHUB_HTTPS}/${POWERLEVEL10k_MEDIA_REPO}/raw/master/MesloLGS%20NF%20Regular.ttf"
kfontinst "${GITHUB_HTTPS}/${POWERLEVEL10k_MEDIA_REPO}/raw/master/MesloLGS%20NF%20Bold.ttf"
kfontinst "${GITHUB_HTTPS}/${POWERLEVEL10k_MEDIA_REPO}/raw/master/MesloLGS%20NF%20Italic.ttf"
kfontinst "${GITHUB_HTTPS}/${POWERLEVEL10k_MEDIA_REPO}/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf"

# Roboto Mono
kfontinst "${GITHUB_HTTPS}/${NERD_FONTS_REPO}/raw/master/patched-fonts/RobotoMono/Regular/complete/Roboto%20Mono%20Nerd%20Font%20Complete.ttf"

# Hurmit
kfontinst "${GITHUB_HTTPS}/${NERD_FONTS_REPO}/raw/master/patched-fonts/Hermit/Medium/complete/Hurmit%20Medium%20Nerd%20Font%20Complete.otf"
kfontinst "${GITHUB_HTTPS}/${NERD_FONTS_REPO}/raw/master/patched-fonts/Hermit/Medium/complete/Hurmit%20Medium%20Nerd%20Font%20Complete%20Mono.otf"

exit 0
