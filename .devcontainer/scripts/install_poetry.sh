#!/usr/bin/env bash

pipx install poetry==1.8.2
pipx ensurepath

mkdir $ZSH_CUSTOM/plugins/poetry
poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry
