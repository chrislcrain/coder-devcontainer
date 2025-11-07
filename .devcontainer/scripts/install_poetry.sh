#!/usr/bin/env bash

pipx install poetry==1.8.2
pipx ensurepath

ZSH_CUSTOM="/home/coder/.oh-my-zsh"

mkdir $ZSH_CUSTOM/plugins/poetry
poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry
