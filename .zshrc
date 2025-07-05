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

export PATH="$PATH:$HOME/.config/composer/vendor/bin"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

function vim() {
  local file
  file=$(fzf) || return
  nvim "$file"
}


function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

export PATH="/home/pedro/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/pedro/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

if command -v tmux &> /dev/null; then
  if [ -z "$TMUX" ] && [ -n "$PS1" ]; then
    tmux attach -t 0 || tmux new -s default
  fi
fi

