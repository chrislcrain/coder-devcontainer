#!/usr/bin/env bash

pipx install poetry==1.8.2
pipx ensurepath

ZSH_CUSTOM="/home/coder/.oh-my-zsh"

mkdir -p $ZSH_CUSTOM/plugins/poetry
poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry

plugin="zsh-autosuggestions"
zshrc="$HOME/.zshrc"

# Add the plugin if it's not already present
if ! grep -qE "plugins=.*\b$plugin\b" "$zshrc"; then
  # Insert the plugin into the plugins() array (at the end)
  sed -i'' -e "s/^\(plugins=.*\)(/\1 $plugin)/" "$zshrc"
fi

