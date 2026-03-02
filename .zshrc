export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="bureau"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting fzf-dir-navigator)

source $ZSH/oh-my-zsh.sh

alias dotconfigs="cd ~/dotfiles && vim"
alias sail="./vendor/bin/sail"
alias ar="php artisan"
alias comp="composer"
alias q="exit"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export PATH="$PATH:$HOME/.config/composer/vendor/bin"

export PATH="$PATH:/home/pedro/.config/herd-lite/bin"
export PHP_INI_SCAN_DIR="/home/pedro/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

eval "$(pyenv init - bash)"

function vim() {
    if [[ $1 ]]; then
        nvim $1
        return
    fi

    local file
    file=$(fzf) || return
    nvim "$file"
}

if command -v tmux &> /dev/null; then
    if [ -z "$TMUX" ] && [ -n "$PS1" ]; then
        tmux attach -t default || tmux new -s default
    fi
fi

