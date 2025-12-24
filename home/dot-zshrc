source $HOME/.common_shell

export TERM="alacritty"

bindkey '^R' history-incremental-search-backward
bindkey -v

alias cat="bat"
alias ls="exa"

function rgnvim() {
  rg --vimgrep "$@" \
    | fzf --delimiter : --nth 1,2,3,4 \
           --preview 'bat --style=numbers --color=always --highlight-line {2} {1}' \
    | awk -F: '{print $1, $2}' \
    | xargs -r sh -c 'nvim +"$1" "$0"'
}
function battery_status() {
    perc1=$(acpi | grep -i 'Battery 0' | sed 's/^[^,]*, //' | awk '{print $1}' | tr -d '%,')
    perc2=$(acpi | grep -i 'Battery 1' | sed 's/^[^,]*, //' | awk '{print $1}' | tr -d '%,')
	echo -e "$(((perc1 + perc2) / 2))"
}
function time_status_custom() {
	time=$(timedatectl | grep Local | awk '{print $5}' | awk -F: '{print $1 ":" $2 }')
	echo -e "$time"
}
function up() {
	user=$(pwd)
	echo $user
}

function bdata() {
	cd ~/shelter/projects/bigdata2025/
	nvim .
}

function sc() {
	cd ~/shelter/projects/scripts/
	nvim . -c
}
function tm() {
    if [[ -n "$TMUX" ]]; then
        tmux detach
    else
        tmux attach 2>/dev/null || tmux new-session
    fi
}
function r() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0000000" #black
    echo -en "\e]P8393939" #darkgrey
    echo -en "\e]P1D75F5F" #darkred
    echo -en "\e]P9E33636" #red
    echo -en "\e]P287AF5F" #darkgreen
    echo -en "\e]PA98E34D" #green
    echo -en "\e]P3D7AF87" #brown
    echo -en "\e]PBFFD75F" #yellow
    echo -en "\e]P49292E3" #darkblue
    echo -en "\e]PCB9B9F3" #blue
    echo -en "\e]P5BD53A5" #darkmagenta
    echo -en "\e]PDD633B2" #magenta
    echo -en "\e]P65FAFAF" #darkcyan
    echo -en "\e]PE44C9C9" #cyan
    echo -en "\e]P7AAAAAA" #lightgrey
    echo -en "\e]PFCCCCCC" #white
    clear #for background artifacting
fi

if [ -f "/etc/NIXOS" ]; then
    eval "$(starship init zsh)"
fi

# opencode
export PATH=/home/jonas/.opencode/bin:$PATH

# Added by GitLab Knowledge Graph installer
# Wird auch von uv genutzt
export PATH="$HOME/.local/bin:$PATH"
