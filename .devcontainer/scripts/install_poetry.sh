#!/usr/bin/env bash

pipx install poetry==1.8.2
pipx ensurepath

ZSH_CUSTOM="/home/coder/.oh-my-zsh"

mkdir -p $ZSH_CUSTOM/plugins/poetry
$HOME/.local/bin/poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry
