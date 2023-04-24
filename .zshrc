export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="bureau"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

source $ZSH/oh-my-zsh.sh
