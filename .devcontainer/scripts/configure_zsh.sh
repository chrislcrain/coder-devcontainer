#!/usr/bin/env bash
set -euo pipefail

USER_HOME="${HOME}"
ZSH="${USER_HOME}/.oh-my-zsh"

# Oh My Zsh
if [ ! -d "${ZSH}" ]; then
  RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Powerlevel10k
if [ ! -d "${USER_HOME}/.powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${USER_HOME}/.powerlevel10k"
fi
grep -qxF 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' "${USER_HOME}/.zshrc" || \
  echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >> "${USER_HOME}/.zshrc"

# Plugins
ZSH_CUSTOM="${ZSH}/custom"
SYNTAX="${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting"
AUTOSUG="${ZSH_CUSTOM}/plugins/zsh-autosuggestions"

[ -d "${SYNTAX}" ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${SYNTAX}"
[ -d "${AUTOSUG}" ] || git clone https://github.com/zsh-users/zsh-autosuggestions "${AUTOSUG}"

if ! grep -q "plugins=.*zsh-syntax-highlighting.*zsh-autosuggestions" "${USER_HOME}/.zshrc"; then
  sed -i '/^plugins=/ s/)/ zsh-syntax-highlighting zsh-autosuggestions)/' "${USER_HOME}/.zshrc" || \
  echo 'plugins=(git zsh-syntax-highlighting zsh-autosuggestions)' >> "${USER_HOME}/.zshrc"
fi

# Optional: bring your prebuilt P10K config into the container image
if [ -f "/usr/local/share/devcontainer/.p10k.zsh" ]; then
  cp /usr/local/share/devcontainer/.p10k.zsh "${USER_HOME}/.p10k.zsh"
fi

echo "configure-zsh.sh complete"
