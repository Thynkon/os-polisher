#!/usr/bin/env bash

source "config.sh"

OH_MY_ZSH_DIR="$HOME/.config/oh-my-zsh"
ZSH_CUSTOM="$OH_MY_ZSH_DIR/custom"

# Oh-my-zsh
ZSH="$OH_MY_ZSH_DIR" sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# powerlevel
git clone $GITHUB_HTTPS/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

### Plugins
# alias-tips
git clone $GITHUB_HTTPS/djui/alias-tips.git $ZSH_CUSTOM/plugins/alias-tips

# zsh-completions
git clone $GITHUB_HTTPS/zsh-users/zsh-completions $ZSH_CUSTOM/plugins/zsh-completions

# zsh-syntax-highlighting
git clone $GITHUB_HTTPS/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# zsh-autosuggestions (fish like)
git clone $GITHUB_HTTPS/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

chsh -s $(which zsh)
