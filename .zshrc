export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="bureau"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias luamake="/home/pedro/Github/lua-language-server/3rd/luamake/luamake"
alias zshconf="nvim ~/.zshrc"
alias nvimconf="cd ~/.config/nvim"
alias sail="./vendor/bin/sail"
alias q="exit"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:$HOME/.config/composer/vendor/bin"


eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function sn() {
    echo "App name:"
    read appname
    echo "Available services:"
    echo "1 - mysql         | 2 - pgsql     | 3 - mariadb   | 4 - redis     | 5 - memcached" 
    echo "6 - meilisearch   | 7 - typesense | 8 - minio     | 9 - selenium  | 10 - mailpit" 
    echo "0 - Stop"

    services=()
    while true; do
        echo -n "Include: "
        read choice

        if [[ "$choice" == "0" ]]; then
            break
        fi

        case "$choice" in
            1) services+=("mysql") ;;
            2) services+=("pgsql") ;;
            3) services+=("mariadb") ;;
            4) services+=("redis") ;;
            5) services+=("memcached") ;;
            6) services+=("meilisearch") ;;
            7) services+=("typesense") ;;
            8) services+=("minio") ;;
            9) services+=("selenium") ;;
            10) services+=("mailpit") ;;
            *) echo "Invalid option, try again." ;;
        esac
    done

    # Join selected services with commas
    service_list=$(IFS=,; echo "${services[*]}")

    # Build the URL and execute it
    echo "Building app with current url: https://laravel.build/$appname?with=$service_list\n"
    curl -s "https://laravel.build/$appname?with=$service_list" | bash
}

setxkbmap -option "caps:swapescape"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
export DRI_PRIME=1
. "/home/pedro/.deno/env"
