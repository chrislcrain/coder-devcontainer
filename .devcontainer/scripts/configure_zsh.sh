#!/usr/bin/env bash
set -euo pipefail

USER_HOME="/home/coder"
ZSH_CUSTOM="$USER_HOME/.oh-my-zsh/custom"
ZSHRC="$USER_HOME/.zshrc"
SYNTAX_HIGHLIGHTING="$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
AUTOSUGGESTIONS="$ZSH_CUSTOM/plugins/zsh-autosuggestions"

# Install p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/coder/.powerlevel10k

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$SYNTAX_HIGHLIGHTING"

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions "$AUTOSUGGESTIONS"

echo "Plugins installed and .zshrc updated for user coder."
