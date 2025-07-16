export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="bureau"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias dotconfigs="cd ~/dotfiles && nvim ."
alias sail="./vendor/bin/sail"
alias ar="php artisan"
alias comp="composer"
alias q="exit"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

eval "$(pyenv init - bash)"

function vim() {
    if [[ $1 ]]; then
        nvim $1
    else
        local file
        file=$(fzf --tmux) || return
        nvim "$file"
    fi
}

function fd() {
    cd "$(find "$HOME" \( -path '*/node_modules' -o -path '*/.git' -o -path '*/venv' \) -prune -o -type d -print | fzf --tmux)"
}

function yy() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

if command -v tmux &> /dev/null; then
    if [ -z "$TMUX" ] && [ -n "$PS1" ]; then
        tmux attach -t default || tmux new -s default
    fi
fi

