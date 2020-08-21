#!/usr/bin/env bash

install_vscodium() {
	# Import gpg key
	rpm --import https://packages.microsoft.com/keys/microsoft.asc

	cat >> /etc/yum.repos.d/vscodium.repo  <<- EOM
	[gitlab.com_paulcarroty_vscodium_repo]
	name=gitlab.com_paulcarroty_vscodium_repo
	baseurl=https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/
	enabled=1
	gpgcheck=1
	repo_gpgcheck=1
	gpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg
	EOM


	dnf check-update
	dnf install -y codium
}

install_vscodium_extensions() {
	extensions=(
		amiralizadeh9480.laravel-extra-intellisense
		bmewburn.vscode-intelephense-client
		codingyu.laravel-goto-view
		editorconfig.editorconfig
		felixfbecker.php-debug
		felixfbecker.php-intellisense
		felixfbecker.php-pack
		mikestead.dotenv
		onecentlin.laravel5-snippets
		onecentlin.laravel-blade
		onecentlin.laravel-extension-pack
		ryannaddy.laravel-artisan
		zhuangtongfa.material-theme
	)

	for extension in "${extensions[@]}"; do
		codium --install-extension "${extension}"
	done
}
