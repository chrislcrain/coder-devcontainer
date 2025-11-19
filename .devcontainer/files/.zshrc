export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  poetry
  git 
  zsh-syntax-highlighting 
  zsh-autosuggestions
)

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

export PATH="$HOME/.local/bin:$PATH"

if [[ -o interactive ]]; then
  [[ -r ~/.p10k.zsh ]] && source ~/.p10k.zsh
fi

source $ZSH/oh-my-zsh.sh
source $HOME/.powerlevel10k/powerlevel10k.zsh-theme
source $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
