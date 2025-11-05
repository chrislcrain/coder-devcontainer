#!/usr/bin/env bash
set -euo pipefail

if [ -d /home/coder ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/coder/.powerlevel10k
  # Add to .zshrc if not present
  grep -qxF 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' "/home/coder/.zshrc" || \
    echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >> "/home/coder/.zshrc"
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Define variables
USER_HOME="/home/coder"
ZSH_CUSTOM="$USER_HOME/.oh-my-zsh/custom"
ZSHRC="$USER_HOME/.zshrc"
SYNTAX_HIGHLIGHTING="$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
AUTOSUGGESTIONS="$ZSH_CUSTOM/plugins/zsh-autosuggestions"

# Ensure Oh My Zsh exists
if [ ! -d "$USER_HOME/.oh-my-zsh" ]; then
  echo "Oh My Zsh not found in $USER_HOME/.oh-my-zsh. Aborting."
  exit 1
fi

# Install zsh-syntax-highlighting
if [ ! -d "$SYNTAX_HIGHLIGHTING" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$SYNTAX_HIGHLIGHTING"
fi

# Install zsh-autosuggestions
if [ ! -d "$AUTOSUGGESTIONS" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions "$AUTOSUGGESTIONS"
fi

# Make sure target plugins line is present in .zshrc
if ! grep -q "plugins=.*zsh-syntax-highlighting.*zsh-autosuggestions" "$ZSHRC"; then
  sed -i '/^plugins=/ s/)/ zsh-syntax-highlighting zsh-autosuggestions)/' "$ZSHRC"
fi

# Source plugins at the end of .zshrc if not already there
if ! grep -q "zsh-syntax-highlighting.zsh" "$ZSHRC"; then
  echo "source $SYNTAX_HIGHLIGHTING/zsh-syntax-highlighting.zsh" >> "$ZSHRC"
fi
if ! grep -q "zsh-autosuggestions.zsh" "$ZSHRC"; then
  echo "source $AUTOSUGGESTIONS/zsh-autosuggestions.zsh" >> "$ZSHRC"
fi

# Set correct ownership
chown coder:coder "$ZSHRC" "$SYNTAX_HIGHLIGHTING" "$AUTOSUGGESTIONS" -R

echo "Plugins installed and .zshrc updated for user coder."
