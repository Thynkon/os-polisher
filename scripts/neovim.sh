#!/usr/bin/env bash

. "config.sh"

curl -fLo "${HOME}"/.local/share/nvim/site/autoload/plug.vim --create-dirs \
			https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

pip3 install --user pynvim

exit 0
