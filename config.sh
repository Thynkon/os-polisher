#!/usr/bin/env bash

PROGRAM_NAME=$(basename $0)

HOSTNAME_FILE="/etc/hostname"

FEDORA_VERSION=$(rpm -E %fedora)
CPU_ARCH=$(uname -p)

DNF_CONFIG="/etc/dnf/dnf.conf"
RPM_FUSION="https://download1.rpmfusion.org"
RPM_FUSION_FREE="$RPM_FUSION/free/fedora/rpmfusion-free-release-$FEDORA_VERSION.noarch.rpm"
RPM_FUSION_NONFREE="$RPM_FUSION/nonfree/fedora/rpmfusion-nonfree-release-$FEDORA_VERSION.noarch.rpm"

PACKAGES_DIR="${CURRENT_DIR}/packages"

DESKTOP_SOFTWARE="${PACKAGES_DIR}software/desktop"
LAPTOP_SOFTWARE="${PACKAGES_DIR}/software/laptop"
COMMON_SOFTWARE="${PACKAGES_DIR}/software/common"

CODECS_FILE="${PACKAGES_DIR}/codecs"
FONTS_FILE="${PACKAGES_DIR}/fonts"

# GITHUB
GITHUB_USERNAME="Thynkon"
GITHUB_DOMAIN="github.com"
GITHUB_API="https://api.$GITHUB_DOMAIN"
GITHUB_HTTPS="https://$GITHUB_DOMAIN"
GITHUB_SSH="git@$GITHUB_DOMAIN"
