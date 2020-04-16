#!/usr/bin/env bash

install_vscode() {
	# Import gpg key
	rpm --import https://packages.microsoft.com/keys/microsoft.asc

	cat >> /etc/yum.repos.d/vscode.repo  <<- EOM
	[code]
	name=Visual Studio Code
	baseurl=https://packages.microsoft.com/yumrepos/vscode
	enabled=1
	gpgcheck=1
	gpgkey=https://packages.microsoft.com/keys/microsoft.asc
	EOM

	dnf check-update
	dnf install -y code
}

install_vscode_extensions() {
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
		code --install-extension "${extension}"
	done
}
